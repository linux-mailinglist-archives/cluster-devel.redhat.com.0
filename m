Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C05D03C7699
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 20:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626201691;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wPE8MQ+SLNEYkYZRsUEY/Zot4ZBgsre9Sg6DxcfzKR8=;
	b=VfasQFw4mxJVtfAny8oszu1rj1Ggs9c/ekK4V/7wYiL0pnyPoxG0cGiTiTu1o4FjVCkUms
	MKPZcBw2Q61bN8eQIK4pf7wCX9WKR190djYiFlIHB/B7v33vY4zEie0J6fDI2jEHo6LjPx
	7Wt6gvZwfhTNALq43GngJEyycGBy2k4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-T4bT_UPVM2iRvnoQxfzCjA-1; Tue, 13 Jul 2021 14:41:28 -0400
X-MC-Unique: T4bT_UPVM2iRvnoQxfzCjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B250C73A1;
	Tue, 13 Jul 2021 18:41:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07EBE5C1D1;
	Tue, 13 Jul 2021 18:41:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A96DE1809C99;
	Tue, 13 Jul 2021 18:41:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DIfLD0024496 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 14:41:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11459D7E15; Tue, 13 Jul 2021 18:41:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D1ECD93A0
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:41:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 137BF18812C3
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:41:18 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-208-VK7mQrHXMHeTxDD5gRXN6A-1; Tue, 13 Jul 2021 14:41:16 -0400
X-MC-Unique: VK7mQrHXMHeTxDD5gRXN6A-1
Received: by mail-wr1-f69.google.com with SMTP id
	y15-20020a5d614f0000b029013cd60e9baaso6808588wrt.7
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 11:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=wPE8MQ+SLNEYkYZRsUEY/Zot4ZBgsre9Sg6DxcfzKR8=;
	b=HMyHyjH+i9HRmKaSFMzcdBzCMDjk2RQzu4dY7yCmOIBaABayBUKcsbj4zACi3RP9kS
	kGoUoA5sqTjPhR/OqNUPuO8x04XG5cpuba/xy/hl2nGnA1f/1GBw1DZ9ZqcFegSt+0A4
	VmwFx4vw8yqyiYatESB47pEr8z5gx3rL0taLJ4JsPn/XoAyU+mHH6YqDmOPEgrKqHgaL
	KUduxyl0PO+m5jED4iPiFsb6MddBVwPHJwHnRSBWv3zIn8hHmm1RO2w9arS1qjbp/fao
	WuIzlYFdLWu1Fz/QIO3vOEzajX635qqDaitlYYqinyIsDSUdfltcuG1c/54vEq4WcwUR
	IPww==
X-Gm-Message-State: AOAM533psRxrSJvs/407tgPJOd+8kFaWuja3sWWvxnezaYnK0PkhxQVi
	Z7JaZSOOGeugiuKZLfH4lMRyYWam4gwvNW57MA5Fa0b2oOQCDOtWruRo8SgUzaJx3Mzi2nAEhGe
	y8U0cYLf0L5XjoMwN1pi4Kg==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr6633672wmh.104.1626201675205; 
	Tue, 13 Jul 2021 11:41:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg8e1rjkQ3CY8bit2T26696vY1xQN1Ta6pMQXarh7TvHFKvSa1Y5hDsicQCHaTvE1ZRFiDHQ==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr6633656wmh.104.1626201674993; 
	Tue, 13 Jul 2021 11:41:14 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id v9sm6178731wml.36.2021.07.13.11.41.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Jul 2021 11:41:14 -0700 (PDT)
Message-ID: <ac3ca605d90d29e8424abc56ac5f410c0cc5e0b0.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Bob Peterson <rpeterso@redhat.com>, cluster-devel
	<cluster-devel@redhat.com>
Date: Tue, 13 Jul 2021 19:41:13 +0100
In-Reply-To: <20210713180958.66995-9-rpeterso@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
	<20210713180958.66995-9-rpeterso@redhat.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 08/10] gfs2: New log flush watchdog
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2021-07-13 at 13:09 -0500, Bob Peterson wrote:
> This patch adds a new watchdog whose sole purpose is to complain when
> gfs2_log_flush operations are taking too long.
> 
This one is a bit confusing. It says that it is to check if the log
flush is taking too long, but it appears to set a timeout based on the
amount of dirty data that will be written back, so it isn't really the
log flush, but the writeback and log flush that is being timed I think?

It also looks like the timeout is entirely dependent upon the number of
dirty pages too, and not on the log flush size. I wonder about the
performance impact of traversing the list of dirty pages too. If that
can be avoided it should make the implementation rather more efficient,

Steve.

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/incore.h     |  6 ++++++
>  fs/gfs2/log.c        | 47
> ++++++++++++++++++++++++++++++++++++++++++++
>  fs/gfs2/log.h        |  1 +
>  fs/gfs2/main.c       |  8 ++++++++
>  fs/gfs2/ops_fstype.c |  2 ++
>  fs/gfs2/sys.c        |  6 ++++--
>  6 files changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 6f31a067a5f2..566c0053b7c5 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -683,6 +683,8 @@ struct local_statfs_inode {
>  	unsigned int si_jid; /* journal id this statfs inode
> corresponds to */
>  };
>  
> +#define GFS2_LOG_FLUSH_TIMEOUT (HZ / 10) /* arbitrary: 1/10 second
> per page */
> +
>  struct gfs2_sbd {
>  	struct super_block *sd_vfs;
>  	struct gfs2_pcpu_lkstats __percpu *sd_lkstats;
> @@ -849,6 +851,10 @@ struct gfs2_sbd {
>  	unsigned long sd_last_warning;
>  	struct dentry *debugfs_dir;    /* debugfs directory */
>  	unsigned long sd_glock_dqs_held;
> +
> +	struct delayed_work sd_log_flush_watchdog;
> +	unsigned long sd_dirty_pages;
> +	unsigned long sd_log_flush_start;
>  };
>  
>  static inline void gfs2_glstats_inc(struct gfs2_glock *gl, int
> which)
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index f0ee3ff6f9a8..bd2ff5ef4b91 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -19,6 +19,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/writeback.h>
>  #include <linux/list_sort.h>
> +#include <linux/sched/debug.h>
>  
>  #include "gfs2.h"
>  #include "incore.h"
> @@ -32,8 +33,22 @@
>  #include "trace_gfs2.h"
>  #include "trans.h"
>  
> +extern struct workqueue_struct *gfs2_log_flush_wq;
> +
>  static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
>  
> +void gfs2_log_flush_watchdog_func(struct work_struct *work)
> +{
> +	struct delayed_work *dwork = to_delayed_work(work);
> +	struct gfs2_sbd *sdp = container_of(dwork, struct gfs2_sbd,
> +					    sd_log_flush_watchdog);
> +
> +	fs_err(sdp, "log flush pid %u took > %lu secs to write %lu
> pages.\n",
> +	       sdp->sd_logd_process ? pid_nr(task_pid(sdp-
> >sd_logd_process)) :
> +	       0, (jiffies - sdp->sd_log_flush_start) / HZ,
> +	       sdp->sd_dirty_pages);
> +}
> +
>  /**
>   * gfs2_struct2blk - compute stuff
>   * @sdp: the filesystem
> @@ -1016,6 +1031,26 @@ static void trans_drain(struct gfs2_trans *tr)
>  	}
>  }
>  
> +/**
> + * count_dirty_pages - rough count the dirty ordered writes pages
> + * @sdp: the filesystem
> + *
> + * This is not meant to be exact. It's simply a rough estimate of
> how many
> + * dirty pages are on the ordered writes list. The actual number of
> pages
> + * may change because we don't keep the lock held during the log
> flush.
> + */
> +static unsigned long count_dirty_pages(struct gfs2_sbd *sdp)
> +{
> +	struct gfs2_inode *ip;
> +	unsigned long dpages = 0;
> +
> +	spin_lock(&sdp->sd_ordered_lock);
> +	list_for_each_entry(ip, &sdp->sd_log_ordered, i_ordered)
> +		dpages += ip->i_inode.i_mapping->nrpages;
> +	spin_unlock(&sdp->sd_ordered_lock);
> +	return dpages;
> +}
> +
>  /**
>   * gfs2_log_flush - flush incore transaction(s)
>   * @sdp: The filesystem
> @@ -1031,8 +1066,19 @@ void gfs2_log_flush(struct gfs2_sbd *sdp,
> struct gfs2_glock *gl, u32 flags)
>  	enum gfs2_freeze_state state = atomic_read(&sdp-
> >sd_freeze_state);
>  	unsigned int first_log_head;
>  	unsigned int reserved_revokes = 0;
> +	unsigned long dpages;
> +
> +	dpages = count_dirty_pages(sdp);
>  
>  	down_write(&sdp->sd_log_flush_lock);
> +	if (dpages)
> +		if (queue_delayed_work(gfs2_log_flush_wq,
> +				       &sdp->sd_log_flush_watchdog,
> +				       round_up(dpages *
> +						GFS2_LOG_FLUSH_TIMEOUT,
> HZ))) {
> +			sdp->sd_dirty_pages = dpages;
> +			sdp->sd_log_flush_start = jiffies;
> +		}
>  	trace_gfs2_log_flush(sdp, 1, flags);
>  
>  repeat:
> @@ -1144,6 +1190,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp,
> struct gfs2_glock *gl, u32 flags)
>  		gfs2_assert_withdraw_delayed(sdp, used_blocks <
> reserved_blocks);
>  		gfs2_log_release(sdp, reserved_blocks - used_blocks);
>  	}
> +	cancel_delayed_work(&sdp->sd_log_flush_watchdog);
>  	up_write(&sdp->sd_log_flush_lock);
>  	gfs2_trans_free(sdp, tr);
>  	if (gfs2_withdrawing(sdp))
> diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
> index fc905c2af53c..962044fba53a 100644
> --- a/fs/gfs2/log.h
> +++ b/fs/gfs2/log.h
> @@ -94,5 +94,6 @@ extern void gfs2_add_revoke(struct gfs2_sbd *sdp,
> struct gfs2_bufdata *bd);
>  extern void gfs2_glock_remove_revoke(struct gfs2_glock *gl);
>  extern void gfs2_flush_revokes(struct gfs2_sbd *sdp);
>  extern void gfs2_ail_drain(struct gfs2_sbd *sdp);
> +extern void gfs2_log_flush_watchdog_func(struct work_struct *work);
>  
>  #endif /* __LOG_DOT_H__ */
> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
> index 28d0eb23e18e..55a7f29742b3 100644
> --- a/fs/gfs2/main.c
> +++ b/fs/gfs2/main.c
> @@ -30,6 +30,7 @@
>  #include "glops.h"
>  
>  struct workqueue_struct *gfs2_control_wq;
> +struct workqueue_struct *gfs2_log_flush_wq;
>  
>  static void gfs2_init_inode_once(void *foo)
>  {
> @@ -178,6 +179,10 @@ static int __init init_gfs2_fs(void)
>  	if (!gfs2_freeze_wq)
>  		goto fail_wq3;
>  
> +	gfs2_log_flush_wq = alloc_workqueue("gfs2_log_flush_wq", 0, 0);
> +	if (!gfs2_log_flush_wq)
> +		goto fail_wq4;
> +
>  	gfs2_page_pool = mempool_create_page_pool(64, 0);
>  	if (!gfs2_page_pool)
>  		goto fail_mempool;
> @@ -189,6 +194,8 @@ static int __init init_gfs2_fs(void)
>  	return 0;
>  
>  fail_mempool:
> +	destroy_workqueue(gfs2_log_flush_wq);
> +fail_wq4:
>  	destroy_workqueue(gfs2_freeze_wq);
>  fail_wq3:
>  	destroy_workqueue(gfs2_control_wq);
> @@ -240,6 +247,7 @@ static void __exit exit_gfs2_fs(void)
>  	destroy_workqueue(gfs_recovery_wq);
>  	destroy_workqueue(gfs2_control_wq);
>  	destroy_workqueue(gfs2_freeze_wq);
> +	destroy_workqueue(gfs2_log_flush_wq);
>  	list_lru_destroy(&gfs2_qd_lru);
>  
>  	rcu_barrier();
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 6a950c4a61e9..b09e61457b23 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -139,6 +139,8 @@ static struct gfs2_sbd *init_sbd(struct
> super_block *sb)
>  	init_waitqueue_head(&sdp->sd_log_flush_wait);
>  	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
>  	mutex_init(&sdp->sd_freeze_mutex);
> +	INIT_DELAYED_WORK(&sdp->sd_log_flush_watchdog,
> +			  gfs2_log_flush_watchdog_func);
>  
>  	return sdp;
>  
> diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
> index c0a34d9ddee4..c90d9f48571a 100644
> --- a/fs/gfs2/sys.c
> +++ b/fs/gfs2/sys.c
> @@ -96,7 +96,8 @@ static ssize_t status_show(struct gfs2_sbd *sdp,
> char *buf)
>  		     "sd_log_flush_head:        %d\n"
>  		     "sd_log_flush_tail:        %d\n"
>  		     "sd_log_blks_reserved:     %d\n"
> -		     "sd_log_revokes_available: %d\n",
> +		     "sd_log_revokes_available: %d\n"
> +		     "sd_dirty_pages:           %lu\n",
>  		     test_bit(SDF_JOURNAL_CHECKED, &f),
>  		     test_bit(SDF_JOURNAL_LIVE, &f),
>  		     (sdp->sd_jdesc ? sdp->sd_jdesc->jd_jid : 0),
> @@ -124,7 +125,8 @@ static ssize_t status_show(struct gfs2_sbd *sdp,
> char *buf)
>  		     sdp->sd_log_flush_head,
>  		     sdp->sd_log_flush_tail,
>  		     sdp->sd_log_blks_reserved,
> -		     atomic_read(&sdp->sd_log_revokes_available));
> +		     atomic_read(&sdp->sd_log_revokes_available),
> +		     sdp->sd_dirty_pages);
>  	return s;
>  }
>  

