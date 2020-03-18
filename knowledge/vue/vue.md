# Vue

### Routing:
#### In console:
```javascript
// For the current route:
$vm0.$route
// For the router:
$vm0.$router
// To change route:
$vm0.$router.push('models') // Relative
$vm0.$router.push('/models') // Absolute
$vm0.$router.replace('/models') // Does not save history
```

#### In script:
```html
<!-- Conditionally show button -->
<VBtn v-if="$route.path.startsWith('/pipeline/models')" @click="selectModel"> Select Model </VBtn>
```
```javascript
// Conditionally set route
setRoute(model) {
    if (this.$route.path.toLowerCase() === '/pipeline') {
    this.$router.push(`pipeline/models/${model}`)
    }
}
```