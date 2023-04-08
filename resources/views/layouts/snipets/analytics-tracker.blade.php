<script>
    const project = "{{ env('ANALYTICS_PROJECT', env('APP_NAME')) }}";
    const prop_page = {
        content_type: '{{ $page }}',
        content_ids: [project],
        project,
    };

    fbq('track', 'ViewContent', prop_page);
</script>
