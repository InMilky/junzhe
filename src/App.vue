<template>
  <div id="app">
    <router-view/>
  </div>
</template>
<script>
export default {
  name: 'App'
}
</script>
<style>
body {
  display: block;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
#app{
  width: 100%;
  min-height: 100%;
  overflow: hidden;
  font-size: 16px;
  margin: 0;
  padding: 0;
}
</style>
