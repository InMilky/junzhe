<template>
  <div class="upload">
    <el-upload
      class="upload-demo"
      ref="upload"
      action="/server/item/upload"
      :on-exceed="handleExceed"
      multiple
      :limit="3"
      drag
      :auto-upload="false"
      :before-upload="handleBeforeUpload"
      :on-change="handleChange"
      :on-remove="handleRemove"
      :on-error="handleError"
      :file-list="imgList"
      :data="uploadData"
      list-type="picture">
<!--      accept='image/png,image/jpg,image/gif'
      :on-success="handleSuccess"
      :before-remove="beforeRemove"
      -->
<!--      <el-button type="text" icon="el-icon-upload">点击上传</el-button>-->
      <i class="el-icon-upload"></i>
      <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
    </el-upload>
    <el-button type="primary" @click="submitUpload">点击上传</el-button>
    <div>filename:{{filename}}</div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      uploadData: {},
      imgList: [],
      filename: '',
      fileList: []
    }
  },
  methods: {
    handleExceed (files, fileList) {
      this.$message.warning(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`)
    },
    // 文件超出个数限制时的钩子
    exceedFile (files, fileList) {
      this.$notify.warning({
        title: '警告',
        message: `只能选择 ${
          this.limitNum
        } 个文件，当前共选择了 ${files.length + fileList.length} 个`
      })
    },
    // 上传前判断文件是否符合要求
    handleBeforeUpload (file) {
      const isIMAGE = file.type === 'image/jpg' || 'image/jpeg' || 'image/png'
      const isLt30M = file.size < 1024 * 1024 * 30
      if (!isIMAGE) {
        this.$message.error('上传文件只能是图片格式!')
      }
      if (!isLt30M) {
        this.$message.error('上传的图片大小不能超过 30MB!')
        return
      }
      return isLt30M && isIMAGE
    },
    // beforeRemove (file, fileList) {
    //   console.log('beforeRemove-file:', file)
    //   console.log('beforeRemove-fileList:', fileList)
    //   return this.$confirm(`确定移除 ${file.name}文件吗？`)
    // },
    handleRemove (file, fileList) {
      console.log('handleRemove-file:', file)
      console.log('handleRemove-fileList:', fileList)
      this.imgList.splice(this.imgList.indexOf(file), 1)
    },
    handleChange (file, fileList) {
      this.imgList.push({ name: file.name, url: file.url })
      this.filename = file.name + file.url
      this.fileList = fileList
      // if (res.code === 200) {
      //   this.value.url = res.data.data
      //   this.$message.success('图片上传成功')
      // } else {
      //   this.$message.error('图片上传失败，请重新上传')
      // }
    },
    handleError (res, file, fileList) {
      console.log('handleError-res:', res)
      console.log('handleError-file:', file)
      if (res.code === 200) {
        this.value.url = res.data.data
        this.$message.success('图片上传成功')
      } else {
        this.$message.error('图片上传失败，请重新上传')
      }
    },
    // handleSuccess (res, file, fileList) {
    //   console.log('handleSuccess-res:', res)
    //   console.log('handleSuccess-file:', file)
    //   if (res.code === 200) {
    //     this.value.url = res.data.data
    //     this.$message.success('图片上传成功')
    //   } else {
    //     this.fileList.splice(this.fileList.indexOf(file), 1)
    //     this.$message.error('图片上传失败，请重新上传')
    //   }
    // },
    submitUpload () {
      const formData = new FormData()
      formData.append('file', this.fileList[0].raw)
      this.$axios.post('/item/upload',
        formData, { headers: { 'Content-Type': 'multipart/form-data;charset=utf-8' } })
        .then(res => {
          this.filename = res
        }).catch(err => {
          console.log(err)
        })
    }
  }
}
</script>

<style scoped>

</style>
