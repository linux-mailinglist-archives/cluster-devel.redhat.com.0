Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8154FFF0
	for <lists+cluster-devel@lfdr.de>; Sat, 18 Jun 2022 00:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655504983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RuJQqdDgviYIoHPhrwibuOgJZBYMnjO7KLnENqFDuJo=;
	b=V5K3yOuXCAMuCGPVPeddOzOaa467c9ZN4pAQtf6sy+R2Kopbzf3II03DEf2AecRJSTztOX
	KjPpxaSnwAtcjTCUj8Pul5pdcPiuOLC1YpNxHQN0xWGbMyJhd8WIkvIdSIUk8tF5IHHCaY
	AQe9DqITnkyndxVDG18jRtem/ZmBwYY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-EtL61Nf1NV-QMC4PhLtZ3A-1; Fri, 17 Jun 2022 18:29:37 -0400
X-MC-Unique: EtL61Nf1NV-QMC4PhLtZ3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A0F83C0D181;
	Fri, 17 Jun 2022 22:29:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E57740E80E0;
	Fri, 17 Jun 2022 22:29:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 536BC1947065;
	Fri, 17 Jun 2022 22:29:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7731194705F for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Jun 2022 22:29:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C648B1415109; Fri, 17 Jun 2022 22:29:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C26741415108
 for <cluster-devel@redhat.com>; Fri, 17 Jun 2022 22:29:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA1B985A581
 for <cluster-devel@redhat.com>; Fri, 17 Jun 2022 22:29:35 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-AYeShLHBNxSq9Elkoxo9Mg-1; Fri, 17 Jun 2022 18:29:34 -0400
X-MC-Unique: AYeShLHBNxSq9Elkoxo9Mg-1
Received: by mail-qv1-f71.google.com with SMTP id
 kk8-20020a056214508800b004645738eff6so6173680qvb.8
 for <cluster-devel@redhat.com>; Fri, 17 Jun 2022 15:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RuJQqdDgviYIoHPhrwibuOgJZBYMnjO7KLnENqFDuJo=;
 b=iiDyh109rDqVlcvBYxLB2VR+D+91DRFjkWs8DrU29iNbxiT2nSYJTWTgwhi/KBB+WY
 nxl48DH4iD9b85oOMqDNP82NfJN7ggLeMeZme+kN58Ssg0paDT0n1WVmRyybN/jNEel/
 uLewRQxxxgfY5NCnokGCMoZq4eyP1TtOaIFNpbmNaPhUTZyI7z7XVqPe5tSSUTzjrxkD
 S028EoXlnSXeQ8L4XS+q2jpcOY1LRq6HuUM5k3piS6iKXQWhS4nCHicbTvgXULlrv/Zg
 NMXLivCVaz+Zd4e9j474NH1yPQNtU6LbqQTGnN5oL168cKo/uUHSf0O9VpAyZA2RwpD2
 YG7g==
X-Gm-Message-State: AJIora+f/y7ERUWRPCV7NFVTm8h6mfw+lh3KVZDCfDVfZAVXRvU90nas
 BA5Qxjv8UUaYv9w2NdAl1f2TMH0dDbRBNSv5mfYLGAnLJ1sByom2skvlTcaI+iyXN9ejzuGiR8U
 6v6hkXnh1IMJdvzTMKfuG/TKgAFoLFzkZZleuEQ==
X-Received: by 2002:a05:620a:6006:b0:6a6:c005:7c14 with SMTP id
 dw6-20020a05620a600600b006a6c0057c14mr8765915qkb.691.1655504973462; 
 Fri, 17 Jun 2022 15:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vnyCN52uTWcj20zdE+KIq5LYr26ZUArhWbs2a8u8wRV76miqUr0DcBX1qQuRE2GOsEC0BzXOl09RfytTPzCcc=
X-Received: by 2002:a05:620a:6006:b0:6a6:c005:7c14 with SMTP id
 dw6-20020a05620a600600b006a6c0057c14mr8765904qkb.691.1655504973248; Fri, 17
 Jun 2022 15:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220617200036.251778-1-aahringo@redhat.com>
 <20220617200036.251778-3-aahringo@redhat.com>
In-Reply-To: <20220617200036.251778-3-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 17 Jun 2022 18:29:22 -0400
Message-ID: <CAK-6q+gQKEsOKXZmOkg9+bL_WjH4PZg6qJXTaDNynQoq3by3sg@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH dlm/next 2/5] fs: dlm: remove warn
 waiter handling
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Jun 17, 2022 at 4:00 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch removes a feature in DLM to warn about if we don't get an
> answer back if we send a DLM message out and we wait for a reply
> message. There are in my opinion two reasons to add such warning, first
> is to know there might be a communication error and a message drop due
> communication errors. Second the other side dropped the message on stack
> because some reason.
>
> However the first reason the midcomms layer will notify us if a message
> was received otherwise midcomms debugfs can tell us if there are still
> pending messages around.
>
> For the second reason we can check the other nodes debug messages to see
> if there was a drop on application layer. However I think the initial
> idea of this feature was to check for the first reason.
>
> This patch also removes the configfs entry waitwarn_us which is not
> being set by official dlm user space software, we assume fail to setting
> this configfs entry will not end in an critical error.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/config.c       |  7 ----
>  fs/dlm/config.h       |  1 -
>  fs/dlm/dlm_internal.h |  1 -
>  fs/dlm/lock.c         | 80 -------------------------------------------
>  fs/dlm/lockspace.c    |  1 -
>  5 files changed, 90 deletions(-)
>
> diff --git a/fs/dlm/config.c b/fs/dlm/config.c
> index 42eee2783756..081fd201e3a8 100644
> --- a/fs/dlm/config.c
> +++ b/fs/dlm/config.c
> @@ -76,7 +76,6 @@ struct dlm_cluster {
>         unsigned int cl_protocol;
>         unsigned int cl_mark;
>         unsigned int cl_timewarn_cs;
> -       unsigned int cl_waitwarn_us;
>         unsigned int cl_new_rsb_count;
>         unsigned int cl_recover_callbacks;
>         char cl_cluster_name[DLM_LOCKSPACE_LEN];
> @@ -103,7 +102,6 @@ enum {
>         CLUSTER_ATTR_PROTOCOL,
>         CLUSTER_ATTR_MARK,
>         CLUSTER_ATTR_TIMEWARN_CS,
> -       CLUSTER_ATTR_WAITWARN_US,
>         CLUSTER_ATTR_NEW_RSB_COUNT,
>         CLUSTER_ATTR_RECOVER_CALLBACKS,
>         CLUSTER_ATTR_CLUSTER_NAME,
> @@ -225,7 +223,6 @@ CLUSTER_ATTR(log_info, NULL);
>  CLUSTER_ATTR(protocol, dlm_check_protocol_and_dlm_running);
>  CLUSTER_ATTR(mark, NULL);
>  CLUSTER_ATTR(timewarn_cs, dlm_check_zero);
> -CLUSTER_ATTR(waitwarn_us, NULL);
>  CLUSTER_ATTR(new_rsb_count, NULL);
>  CLUSTER_ATTR(recover_callbacks, NULL);
>
> @@ -241,7 +238,6 @@ static struct configfs_attribute *cluster_attrs[] = {
>         [CLUSTER_ATTR_PROTOCOL] = &cluster_attr_protocol,
>         [CLUSTER_ATTR_MARK] = &cluster_attr_mark,
>         [CLUSTER_ATTR_TIMEWARN_CS] = &cluster_attr_timewarn_cs,
> -       [CLUSTER_ATTR_WAITWARN_US] = &cluster_attr_waitwarn_us,
>         [CLUSTER_ATTR_NEW_RSB_COUNT] = &cluster_attr_new_rsb_count,
>         [CLUSTER_ATTR_RECOVER_CALLBACKS] = &cluster_attr_recover_callbacks,
>         [CLUSTER_ATTR_CLUSTER_NAME] = &cluster_attr_cluster_name,
> @@ -433,7 +429,6 @@ static struct config_group *make_cluster(struct config_group *g,
>         cl->cl_log_info = dlm_config.ci_log_info;
>         cl->cl_protocol = dlm_config.ci_protocol;
>         cl->cl_timewarn_cs = dlm_config.ci_timewarn_cs;
> -       cl->cl_waitwarn_us = dlm_config.ci_waitwarn_us;
>         cl->cl_new_rsb_count = dlm_config.ci_new_rsb_count;
>         cl->cl_recover_callbacks = dlm_config.ci_recover_callbacks;
>         memcpy(cl->cl_cluster_name, dlm_config.ci_cluster_name,
> @@ -955,7 +950,6 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
>  #define DEFAULT_PROTOCOL           DLM_PROTO_TCP
>  #define DEFAULT_MARK               0
>  #define DEFAULT_TIMEWARN_CS      500 /* 5 sec = 500 centiseconds */
> -#define DEFAULT_WAITWARN_US       0
>  #define DEFAULT_NEW_RSB_COUNT    128
>  #define DEFAULT_RECOVER_CALLBACKS  0
>  #define DEFAULT_CLUSTER_NAME      ""
> @@ -972,7 +966,6 @@ struct dlm_config_info dlm_config = {
>         .ci_protocol = DEFAULT_PROTOCOL,
>         .ci_mark = DEFAULT_MARK,
>         .ci_timewarn_cs = DEFAULT_TIMEWARN_CS,
> -       .ci_waitwarn_us = DEFAULT_WAITWARN_US,
>         .ci_new_rsb_count = DEFAULT_NEW_RSB_COUNT,
>         .ci_recover_callbacks = DEFAULT_RECOVER_CALLBACKS,
>         .ci_cluster_name = DEFAULT_CLUSTER_NAME
> diff --git a/fs/dlm/config.h b/fs/dlm/config.h
> index df92b0a07fc6..cb23d018e863 100644
> --- a/fs/dlm/config.h
> +++ b/fs/dlm/config.h
> @@ -38,7 +38,6 @@ struct dlm_config_info {
>         int ci_protocol;
>         int ci_mark;
>         int ci_timewarn_cs;
> -       int ci_waitwarn_us;
>         int ci_new_rsb_count;
>         int ci_recover_callbacks;
>         char ci_cluster_name[DLM_LOCKSPACE_LEN];
> diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
> index 151f98fc3f22..19136b7374a1 100644
> --- a/fs/dlm/dlm_internal.h
> +++ b/fs/dlm/dlm_internal.h
> @@ -258,7 +258,6 @@ struct dlm_lkb {
>         struct list_head        lkb_ownqueue;   /* list of locks for a process */
>         struct list_head        lkb_time_list;
>         ktime_t                 lkb_timestamp;
> -       ktime_t                 lkb_wait_time;
>         unsigned long           lkb_timeout_cs;
>
>         struct mutex            lkb_cb_mutex;
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index e80d42ba64ae..080cd216a9a4 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -1402,75 +1402,6 @@ static int msg_reply_type(int mstype)
>         return -1;
>  }
>
> -static int nodeid_warned(int nodeid, int num_nodes, int *warned)
> -{
> -       int i;
> -
> -       for (i = 0; i < num_nodes; i++) {
> -               if (!warned[i]) {
> -                       warned[i] = nodeid;
> -                       return 0;
> -               }
> -               if (warned[i] == nodeid)
> -                       return 1;
> -       }
> -       return 0;
> -}
> -
> -void dlm_scan_waiters(struct dlm_ls *ls)
> -{

there is probably a prototype which I need to remove as well... and I
need to check the other patches...

- Alex

