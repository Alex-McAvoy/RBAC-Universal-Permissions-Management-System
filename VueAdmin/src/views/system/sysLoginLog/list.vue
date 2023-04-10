<template>
  <div class="app-container">
    <!-- 搜索框 -->
    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row :gutter="30">
          <el-col :span="8">
            <el-form-item label="关 键 字">
              <el-input v-model="searchObj.keyword" placeholder="用户名/IP/提示信息" style="width: 95%" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="创建时间">
              <el-date-picker
                v-model="createTimes"
                type="datetimerange"
                range-separator="至"
                start-placeholder="开始时间"
                end-placeholder="结束时间"
                value-format="yyyy-MM-dd HH:mm:ss"
                style="margin-right: 10px;width: 100%;"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-button type="primary" icon="el-icon-search" size="mini" @click="fetchData()">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetData">重置</el-button>
          </el-col>
        </el-row>
      </el-form>
    </div>

    <!-- 表格 -->
    <el-table
      v-loading="listLoading"
      :data="list"
      stripe
      border
      class="table"
      @selection-change="handleUpdateDialogSelectionChange"
    >
      <el-table-column label="序号" width="70" align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column prop="username" label="用户名" align="center" />
      <el-table-column prop="ipAddress" label="登录 IP" align="center" />
      <el-table-column label="状态" align="center">
        <template slot-scope="scope">
          {{ scope.row.status == 1 ? "成功" : "失败" }}
        </template>
      </el-table-column>
      <el-table-column prop="msg" label="提示信息" align="center" />
      <el-table-column prop="createTime" label="创建时间" align="center" />

    </el-table>

    <!-- 分页组件 -->
    <el-pagination
      :current-page="page"
      :total="total"
      :page-size="limit"
      class="pagination"
      layout="total, prev, pager, next, jumper"
      @current-change="fetchData"
    />

  </div>
</template>

<script>
import sysLoginLogApi from '@/api/system/SysLoginLog.js'

export default {
  data() {
    return {
      listLoading: true, // 是否显示加载图标
      list: null, // 数据列表
      total: 0, // 总记录数
      page: 1, // 当前页
      limit: 10, // 每页记录数
      searchObj: {}, // 条件查询封装对象
      createTimes: [] // 按创建时间查询时的时间封装对象
    }
  },
  // 生命周期函数，内存准备完毕，页面尚未渲染
  created() {
    this.fetchData()
  },
  methods: {
    // 发送ajax请求，获取分页查询数据
    fetchData(page = 1) {
      this.page = page
      if (this.createTimes && this.createTimes.length === 2) {
        this.searchObj.createTimeBegin = this.createTimes[0]
        this.searchObj.createTimeEnd = this.createTimes[1]
      }
      sysLoginLogApi.getPageList(this.page, this.limit, this.searchObj)
        .then(response => {
          this.list = response.data.records
          this.total = response.data.total
          this.listLoading = false
        })
    },
    // 重置查询表单
    resetData() {
      this.searchObj = {}
      this.createTimes = []
      this.fetchData()
    }
  }
}
</script>

<style scoped>
.table {
  width: 100%;
  margin-top: 10px;
}

.pagination {
  padding: 30px 0;
  text-align: center;
}

.search-div {
  padding: 10px;
  border: 1px solid #EBEEF5;
  border-radius: 3px;
}
</style>
