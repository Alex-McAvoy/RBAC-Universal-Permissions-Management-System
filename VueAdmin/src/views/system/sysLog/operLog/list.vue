<template>
  <div class="app-container">
    <!-- 搜索框 -->
    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row :gutter="30">
          <el-col :span="8">
            <el-form-item label="关 键 字">
              <el-input v-model="searchObj.keyword" placeholder="系统模块/请求方式/操作人员/IP" style="width: 95%" />
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
    >
      <el-table-column label="序号" width="70" align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column prop="title" label="系统模块" width="80" align="center" />
      <el-table-column prop="operatorType" label="操作类型" width="85" align="center" />
      <el-table-column prop="requestMethod" label="请求方式" width="80" align="center" />
      <el-table-column prop="operName" label="操作人员" width="80" align="center" />
      <el-table-column prop="operIp" label="操作 IP" width="120" align="center" />
      <el-table-column prop="method" label="请求方法" align="center" />
      <el-table-column label="操作状态" align="center" width="80">
        <template slot-scope="scope">
          {{ scope.row.status == 1 ? "成功" : "失败" }}
        </template>
      </el-table-column>
      <el-table-column prop="createTime" label="操作时间" align="center" width="160" />
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
import sysOperLogApi from '@/api/system/sysLog/SysOperLog.js'

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
      sysOperLogApi.getPageList(this.page, this.limit, this.searchObj)
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
