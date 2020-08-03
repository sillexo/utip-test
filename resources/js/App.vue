<template>

</template>

<script>

    import axios from 'axios';

    export default {
        props: {

        },

        data() {
            return {

            }
        },

        components: {

        },

        methods: {
            isMobile() {
                if (screen.width < 1024) {
                    return true;
                } else {
                    return false;
                }
            },
        },

        mounted() {

        }
    }
</script>

<style scoped="">

</style>
