<template>
  <div class="about">

<!--    <el-form ref="form" :model="form" label-width="120px">-->
<!--      <el-form-item label="商品名称">-->
<!--        <el-input v-model="form.title" clearable></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品品牌">-->
<!--        <el-input v-model="form.brand" clearable></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品类型">-->
<!--        <el-select v-model="form.category" placeholder="请选择商品类型">-->
<!--          <el-option label="手机数码" value="1"></el-option>-->
<!--          <el-option label="服装服饰" value="4"></el-option>-->
<!--          <el-option label="个护美妆" value="5"></el-option>-->
<!--        </el-select>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品价格">-->
<!--      <el-input v-model.number="form.price" type="number"></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品优惠价">-->
<!--      <el-input v-model.number="form.mprice" type="number"></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="上架为秒杀商品">-->
<!--        <el-switch v-model="form.miaosha"></el-switch>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="活动时间" v-if="form.miaosha">-->
<!--        <el-col :span="11">-->
<!--          <el-date-picker type="datetime" placeholder="选择开始时间" v-model="form.start_date" style="width: 100%;"></el-date-picker>-->
<!--        </el-col>-->
<!--        <el-col class="line" :span="2">-</el-col>-->
<!--        <el-col :span="11">-->
<!--          <el-time-picker placeholder="选择结束时间" v-model="form.end_date" style="width: 100%;"></el-time-picker>-->
<!--        </el-col>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品图片">-->
<!--        <el-upload-->
<!--          class="upload-demo"-->
<!--          action="/item/upload"-->
<!--          :on-preview="handlePreview"-->
<!--          :on-remove="handleRemove"-->
<!--          :before-remove="beforeRemove"-->
<!--          :on-exceed="handleExceed"-->
<!--          :on-success="handleSuccess"-->
<!--          multiple-->
<!--          drag-->
<!--          :file-list="form.fileList"-->
<!--          list-type="picture">-->
<!--          <i class="el-icon-upload"></i>-->
<!--          <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>-->
<!--          <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>-->
<!--        </el-upload>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品描述">-->
<!--        <el-input type="textarea" v-model="form.desc" maxlength="100" show-word-limit></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item>-->
<!--        <el-button @click="onSubmit('form')" type="danger">立即创建</el-button>-->
<!--        <el-button type="primary">重 置</el-button>-->
<!--      </el-form-item>-->
<!--    </el-form>-->
    <UploadView></UploadView>
  </div>
</template>
<script>
import UploadView from '@/components/admin/uploadView'

export default {
  data () {
    return {
      form: {
        title: '',
        brand: '',
        category: '',
        price: '',
        mprice: '',
        miaosha: false,
        start_date: '',
        end_date: '',
        fileList: [
          { name: 'food.jpeg', url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100' },
          { name: 'food2.jpeg', url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100' }],
        desc: ''
      }
    }
  },
  methods: {
    onSubmit () {
      console.log('submit!')
    },
    handleRemove (file, fileList) {
      const tmp = this.form.fileList
      const url = file.response.result[0].url
      if (tmp.includes(url)) {
        tmp.splice(tmp.findIndex(item => {
          return item === url
        }), 1)
      }
    },
    handleSuccess (response, file, fileList, $event) {
      // 上传成功在表单的某个字段里加一个值
      this.form.fileList.push(file.response.result[0].url)
    },
    handleExceed (files, fileList) {
      this.$message.warning(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`)
    },
    beforeRemove (file, fileList) {
      return this.$confirm(`确定移除 ${file.name}？`)
    }
  },
  components: {
    UploadView
  }
}
</script>
