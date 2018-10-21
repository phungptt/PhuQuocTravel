Vue.mixin({
    data: function() {
      return {
        get isLoggedIn() {
          return false;
        }
      }
    }
  })