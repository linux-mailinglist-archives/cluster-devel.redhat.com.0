Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C006B72DF71
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jun 2023 12:29:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686652166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tMgFd1u5VxyfZnqqN39LhchxoSyTDpfuTzeAaHBmwaU=;
	b=ePmb1xmQNXumo4I8XNT+ssDuorrb6lE0FoFAp+SOv+QEwcMsQ3UfYcqjnhFi/L1m7SRILB
	OvBkMj6ORrvb/gO3TArDD7hZUybNir6c9rTpz3jGZvQcr9uR6PTqtgJh8eeIcNAzmnCio2
	fZGd+9SNahh6b3Nd6Hw0ie9373fpKgU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-UttvQWA3M76DH4ElnjHqDg-1; Tue, 13 Jun 2023 06:29:23 -0400
X-MC-Unique: UttvQWA3M76DH4ElnjHqDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CADF6185A78F;
	Tue, 13 Jun 2023 10:29:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F4006C1604C;
	Tue, 13 Jun 2023 10:29:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 678341946A45;
	Tue, 13 Jun 2023 10:29:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE22C194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 13 Jun 2023 10:29:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 009CD2026833; Tue, 13 Jun 2023 10:29:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1012026D20
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 10:29:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A316A101A531
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 10:29:05 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-wbMuZ-GCNBSg-oO2Pj2TCA-1; Tue, 13 Jun 2023 06:29:04 -0400
X-MC-Unique: wbMuZ-GCNBSg-oO2Pj2TCA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so23323505e9.2
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 03:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686652143; x=1689244143;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tMgFd1u5VxyfZnqqN39LhchxoSyTDpfuTzeAaHBmwaU=;
 b=eF9EUskptTOzfUxlQR4eyqVk5WskmFIXj+xVlkguGAKBfMLJAdPc2rXyO83JLSBLWG
 DlnPa2dy5O0ycv4ZHpBcL5UaT/T07ZWzl59Dfk8K+TZ1+zP/bXw6EVx4CBPocV0w2t/X
 rnANfzOdafBKo0cyfIdbU3s58D64eNV7/1CP4MU0q6KzWrr/4JnxAC4E5XrRoumlVpZM
 UEZTKnHtO6O/00FkzNPBmXXef0Oa4Il2aCiS0OWmdB0gLKjsOyVuhSNjJDHz7iNcIU3X
 WF0JDRvu3XtJFtn+ZcUjzsou6/0No/jENU8Skd/XYaEoCt18qG44AGvTzAqsicyuy5MK
 cDDA==
X-Gm-Message-State: AC+VfDyc5qJK+eiXDkZXVFv6Nqs1Wd+mYnER2cXUsnK8mb0423k/Ipzv
 RDEFWHig7nUv+N7X1br6nFw7Zc3ks+7LrksmeiQmLi7HxL/3GxIw13npkQpZuwhU2sJnbQE9qLO
 1ot7Q0Uq49fPpzKYn0PDtPg==
X-Received: by 2002:a05:600c:2181:b0:3f7:28d8:4317 with SMTP id
 e1-20020a05600c218100b003f728d84317mr7375966wme.15.1686652143060; 
 Tue, 13 Jun 2023 03:29:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vojXczeo+3ocaFQavm7/qnZM4KY6t5ygJFvQmbsGk3WlA0YNAtsZHKDA8uuHxLbiiztxKzA==
X-Received: by 2002:a05:600c:2181:b0:3f7:28d8:4317 with SMTP id
 e1-20020a05600c218100b003f728d84317mr7375951wme.15.1686652142605; 
 Tue, 13 Jun 2023 03:29:02 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a1c7c11000000b003f809461162sm12259276wmc.16.2023.06.13.03.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 03:29:01 -0700 (PDT)
Message-ID: <b22a8c3e-caf4-fe5a-34d8-1018f5883c95@redhat.com>
Date: Tue, 13 Jun 2023 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20230612163347.1293077-1-agruenba@redhat.com>
 <20230612163347.1293077-7-agruenba@redhat.com>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <20230612163347.1293077-7-agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 6/8] gfs2: Rework freeze / thaw logic
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2023 17:33, Andreas Gruenbacher wrote:
> So far, at mount time, gfs2 would take the freeze glock in shared mode
> and then immediately drop it again, turning it into a cached glock that
> can be reclaimed at any time.  To freeze the filesystem cluster-wide,
> the node initiating the freeze would take the freeze glock in exclusive
> mode, which would cause the freeze glock's freeze_go_sync() callback to
> run on each node.  There, gfs2 would freeze the filesystem and schedule
> gfs2_freeze_func() to run.  gfs2_freeze_func() would re-acquire the
> freeze glock in shared mode, thaw the filesystem, and drop the freeze
> glock again.  The initiating node would keep the freeze glock held in
> exclusive mode.  To thaw the filesystem, the initiating node would drop
> the freeze glock again, which would allow gfs2_freeze_func() to resume
> on all nodes, leaving the filesystem in the thawed state.
> 
> It turns out that in freeze_go_sync(), we cannot reliably and safely
> freeze the filesystem.  This is primarily because the final unmount of a
> filesystem takes a write lock on the s_umount rw semaphore before
> calling into gfs2_put_super(), and freeze_go_sync() needs to call
> freeze_super() which also takes a write lock on the same semaphore,
> causing a deadlock.  We could work around this by trying to take an
> active reference on the super block first, which would prevent unmount
> from running at the same time.  But that can fail, and freeze_go_sync()
> isn't actually allowed to fail.
> 
> To get around this, this patch changes the freeze glock locking scheme
> as follows:
> 
> At mount time, each node takes the freeze glock in shared mode.  To
> freeze a filesystem, the initiating node first freezes the filesystem
> locally and then drops and re-acquires the freeze glock in exclusive
> mode.  All other nodes notice that there is contention on the freeze
> glock in their go_callback callbacks, and they schedule
> gfs2_freeze_func() to run.  There, they freeze the filesystem locally
> and drop and re-acquire the freeze glock before re-thawing the
> filesystem.  This is happening outside of the glock state engine, so
> there, we are allowed to fail.
> 
>  From a cluster point of view, taking and immediately dropping a glock is
> indistinguishable from taking the glock and only dropping it upon
> contention, so this new scheme is compatible with the old one.

Nice!

> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>   fs/gfs2/glops.c      |  52 +++++--------
>   fs/gfs2/log.c        |   2 -
>   fs/gfs2/ops_fstype.c |   5 +-
>   fs/gfs2/recovery.c   |  24 +++---
>   fs/gfs2/super.c      | 179 ++++++++++++++++++++++++++++++++++---------
>   fs/gfs2/super.h      |   1 +
>   fs/gfs2/util.c       |  32 +++-----
>   7 files changed, 185 insertions(+), 110 deletions(-)
> 
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 01d433ed6ce7..7c48c7afd6a4 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -561,47 +561,33 @@ static void inode_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
>   }
>   
>   /**
> - * freeze_go_sync - promote/demote the freeze glock
> + * freeze_go_callback - A cluster node is requesting a freeze
>    * @gl: the glock
> + * @remote: true if this came from a different cluster node
>    */
>   
> -static int freeze_go_sync(struct gfs2_glock *gl)
> +static void freeze_go_callback(struct gfs2_glock *gl, bool remote)
>   {
> -	int error = 0;
>   	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
> +	struct super_block *sb = sdp->sd_vfs;
> +
> +	if (!remote ||
> +	    gl->gl_state != LM_ST_SHARED ||
> +	    gl->gl_demote_state != LM_ST_UNLOCKED)
> +		return;
>   
>   	/*
> -	 * We need to check gl_state == LM_ST_SHARED here and not gl_req ==
> -	 * LM_ST_EXCLUSIVE. That's because when any node does a freeze,
> -	 * all the nodes should have the freeze glock in SH mode and they all
> -	 * call do_xmote: One for EX and the others for UN. They ALL must
> -	 * freeze locally, and they ALL must queue freeze work. The freeze_work
> -	 * calls freeze_func, which tries to reacquire the freeze glock in SH,
> -	 * effectively waiting for the thaw on the node who holds it in EX.
> -	 * Once thawed, the work func acquires the freeze glock in
> -	 * SH and everybody goes back to thawed.
> +	 * Try to get an active super block reference to prevent racing with
> +	 * unmount (see trylock_super()).  But note that unmount isn't the only
> +	 * place where a write lock on s_umount is taken, and we can fail here
> +	 * because of things like remount as well.
>   	 */
> -	if (gl->gl_state == LM_ST_SHARED && !gfs2_withdrawn(sdp) &&
> -	    !test_bit(SDF_NORECOVERY, &sdp->sd_flags)) {
> -		atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
> -		error = freeze_super(sdp->sd_vfs);
> -		if (error) {
> -			fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n",
> -				error);
> -			if (gfs2_withdrawn(sdp)) {
> -				atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
> -				return 0;
> -			}
> -			gfs2_assert_withdraw(sdp, 0);
> -		}
> -		queue_work(gfs2_freeze_wq, &sdp->sd_freeze_work);
> -		if (test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
> -			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_FREEZE |
> -				       GFS2_LFC_FREEZE_GO_SYNC);
> -		else /* read-only mounts */
> -			atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
> +	if (down_read_trylock(&sb->s_umount)) {
> +		atomic_inc(&sb->s_active);
> +		up_read(&sb->s_umount);
> +		if (!queue_work(gfs2_freeze_wq, &sdp->sd_freeze_work))
> +			deactivate_super(sb);
>   	}
> -	return 0;
>   }
>   
>   /**
> @@ -761,9 +747,9 @@ const struct gfs2_glock_operations gfs2_rgrp_glops = {
>   };
>   
>   const struct gfs2_glock_operations gfs2_freeze_glops = {
> -	.go_sync = freeze_go_sync,
>   	.go_xmote_bh = freeze_go_xmote_bh,
>   	.go_demote_ok = freeze_go_demote_ok,
> +	.go_callback = freeze_go_callback,
>   	.go_type = LM_TYPE_NONDISK,
>   	.go_flags = GLOF_NONDISK,
>   };
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index d750d1128bed..dca535311dee 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -1136,8 +1136,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
>   		if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
>   			     GFS2_LOG_HEAD_FLUSH_FREEZE))
>   			gfs2_log_shutdown(sdp);
> -		if (flags & GFS2_LOG_HEAD_FLUSH_FREEZE)
> -			atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
>   	}
>   
>   out_end:
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 12eedba45dbb..4ce5718719ac 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -1140,7 +1140,6 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
>   	int silent = fc->sb_flags & SB_SILENT;
>   	struct gfs2_sbd *sdp;
>   	struct gfs2_holder mount_gh;
> -	struct gfs2_holder freeze_gh;
>   	int error;
>   
>   	sdp = init_sbd(sb);
> @@ -1269,15 +1268,15 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
>   		}
>   	}
>   
> -	error = gfs2_freeze_lock_shared(sdp, &freeze_gh, 0);
> +	error = gfs2_freeze_lock_shared(sdp, &sdp->sd_freeze_gh, 0);
>   	if (error)
>   		goto fail_per_node;
>   
>   	if (!sb_rdonly(sb))
>   		error = gfs2_make_fs_rw(sdp);
>   
> -	gfs2_freeze_unlock(&freeze_gh);
>   	if (error) {
> +		gfs2_freeze_unlock(&sdp->sd_freeze_gh);
>   		if (sdp->sd_quotad_process)
>   			kthread_stop(sdp->sd_quotad_process);
>   		sdp->sd_quotad_process = NULL;
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index 61ef07da40b2..afeda936e2be 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -404,7 +404,7 @@ void gfs2_recover_func(struct work_struct *work)
>   	struct gfs2_inode *ip = GFS2_I(jd->jd_inode);
>   	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
>   	struct gfs2_log_header_host head;
> -	struct gfs2_holder j_gh, ji_gh, thaw_gh;
> +	struct gfs2_holder j_gh, ji_gh;
>   	ktime_t t_start, t_jlck, t_jhd, t_tlck, t_rep;
>   	int ro = 0;
>   	unsigned int pass;
> @@ -465,14 +465,14 @@ void gfs2_recover_func(struct work_struct *work)
>   		ktime_ms_delta(t_jhd, t_jlck));
>   
>   	if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
> -		fs_info(sdp, "jid=%u: Acquiring the freeze glock...\n",
> -			jd->jd_jid);
> -
> -		/* Acquire a shared hold on the freeze glock */
> +		mutex_lock(&sdp->sd_freeze_mutex);
>   
> -		error = gfs2_freeze_lock_shared(sdp, &thaw_gh, LM_FLAG_PRIORITY);
> -		if (error)
> +		if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN) {
> +			mutex_unlock(&sdp->sd_freeze_mutex);
> +			fs_warn(sdp, "jid=%u: Can't replay: filesystem "
> +				"is frozen\n", jd->jd_jid);
>   			goto fail_gunlock_ji;
> +		}
>   
>   		if (test_bit(SDF_RORECOVERY, &sdp->sd_flags)) {
>   			ro = 1;
> @@ -496,7 +496,7 @@ void gfs2_recover_func(struct work_struct *work)
>   			fs_warn(sdp, "jid=%u: Can't replay: read-only block "
>   				"device\n", jd->jd_jid);
>   			error = -EROFS;
> -			goto fail_gunlock_thaw;
> +			goto fail_gunlock_nofreeze;
>   		}
>   
>   		t_tlck = ktime_get();
> @@ -514,7 +514,7 @@ void gfs2_recover_func(struct work_struct *work)
>   			lops_after_scan(jd, error, pass);
>   			if (error) {
>   				up_read(&sdp->sd_log_flush_lock);
> -				goto fail_gunlock_thaw;
> +				goto fail_gunlock_nofreeze;
>   			}
>   		}
>   
> @@ -522,7 +522,7 @@ void gfs2_recover_func(struct work_struct *work)
>   		clean_journal(jd, &head);
>   		up_read(&sdp->sd_log_flush_lock);
>   
> -		gfs2_freeze_unlock(&thaw_gh);
> +		mutex_unlock(&sdp->sd_freeze_mutex);
>   		t_rep = ktime_get();
>   		fs_info(sdp, "jid=%u: Journal replayed in %lldms [jlck:%lldms, "
>   			"jhead:%lldms, tlck:%lldms, replay:%lldms]\n",
> @@ -543,8 +543,8 @@ void gfs2_recover_func(struct work_struct *work)
>   	fs_info(sdp, "jid=%u: Done\n", jd->jd_jid);
>   	goto done;
>   
> -fail_gunlock_thaw:
> -	gfs2_freeze_unlock(&thaw_gh);
> +fail_gunlock_nofreeze:
> +	mutex_unlock(&sdp->sd_freeze_mutex);
>   fail_gunlock_ji:
>   	if (jlocked) {
>   		gfs2_glock_dq_uninit(&ji_gh);
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 5f3e699ae922..eb41ab32695a 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -332,7 +332,12 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
>   	struct lfcc *lfcc;
>   	LIST_HEAD(list);
>   	struct gfs2_log_header_host lh;
> -	int error;
> +	int error, error2;
> +
> +	/*
> +	 * Grab all the journal glocks in SH mode.  We are *probably* doing
> +	 * that to prevent recovery.
> +	 */
>   
>   	list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
>   		lfcc = kmalloc(sizeof(struct lfcc), GFP_KERNEL);
> @@ -349,11 +354,13 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
>   		list_add(&lfcc->list, &list);
>   	}
>   
> +	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
> +
>   	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_EXCLUSIVE,
>   				   LM_FLAG_NOEXP | GL_NOPID,
>   				   &sdp->sd_freeze_gh);
>   	if (error)
> -		goto out;
> +		goto relock_shared;
>   
>   	list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
>   		error = gfs2_jdesc_check(jd);
> @@ -368,8 +375,14 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
>   		}
>   	}
>   
> -	if (error)
> -		gfs2_freeze_unlock(&sdp->sd_freeze_gh);
> +	if (!error)
> +		goto out;  /* success */
> +
> +	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
> +
> +relock_shared:
> +	error2 = gfs2_freeze_lock_shared(sdp, &sdp->sd_freeze_gh, 0);
> +	gfs2_assert_withdraw(sdp, !error2);
>   
>   out:
>   	while (!list_empty(&list)) {
> @@ -615,6 +628,8 @@ static void gfs2_put_super(struct super_block *sb)
>   
>   	/*  Release stuff  */
>   
> +	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
> +
>   	iput(sdp->sd_jindex);
>   	iput(sdp->sd_statfs_inode);
>   	iput(sdp->sd_rindex);
> @@ -669,31 +684,81 @@ static int gfs2_sync_fs(struct super_block *sb, int wait)
>   	return sdp->sd_log_error;
>   }
>   
> -void gfs2_freeze_func(struct work_struct *work)
> +static int gfs2_freeze_locally(struct gfs2_sbd *sdp)
>   {
> -	int error;
> -	struct gfs2_holder freeze_gh;
> -	struct gfs2_sbd *sdp = container_of(work, struct gfs2_sbd, sd_freeze_work);
>   	struct super_block *sb = sdp->sd_vfs;
> +	int error;
>   
> -	atomic_inc(&sb->s_active);
> -	error = gfs2_freeze_lock_shared(sdp, &freeze_gh, 0);
> -	if (error) {
> -		gfs2_assert_withdraw(sdp, 0);
> -	} else {
> -		atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
> -		error = thaw_super(sb);
> -		if (error) {
> -			fs_info(sdp, "GFS2: couldn't thaw filesystem: %d\n",
> -				error);
> -			gfs2_assert_withdraw(sdp, 0);
> +	atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
> +
> +	error = freeze_super(sb);
> +	if (error)
> +		goto fail;
> +
> +	if (test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)) {
> +		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_FREEZE |
> +			       GFS2_LFC_FREEZE_GO_SYNC);
> +		if (gfs2_withdrawn(sdp)) {
> +			thaw_super(sb);
> +			error = -EIO;
> +			goto fail;
>   		}
> -		gfs2_freeze_unlock(&freeze_gh);
>   	}
> +	return 0;
> +
> +fail:
> +	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
> +	return error;
> +}
> +
> +static int gfs2_do_thaw(struct gfs2_sbd *sdp)
> +{
> +	struct super_block *sb = sdp->sd_vfs;
> +	int error;
> +
> +	error = gfs2_freeze_lock_shared(sdp, &sdp->sd_freeze_gh, 0);
> +	if (error)
> +		goto fail;
> +	error = thaw_super(sb);
> +	if (!error)
> +		return 0;
> +
> +fail:
> +	fs_info(sdp, "GFS2: couldn't thaw filesystem: %d\n", error);
> +	gfs2_assert_withdraw(sdp, 0);
> +	return error;
> +}
> +
> +void gfs2_freeze_func(struct work_struct *work)
> +{
> +	struct gfs2_sbd *sdp = container_of(work, struct gfs2_sbd, sd_freeze_work);
> +	struct super_block *sb = sdp->sd_vfs;
> +	int error;
> +
> +	mutex_lock(&sdp->sd_freeze_mutex);
> +	error = -EBUSY;
> +	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
> +		goto out_unlock;
> +
> +	error = gfs2_freeze_locally(sdp);
> +	if (error)
> +		goto out_unlock;
> +
> +	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
> +	atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
> +
> +	error = gfs2_do_thaw(sdp);
> +	if (error)
> +		goto out;
> +
> +	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
> +
> +out_unlock:
> +	mutex_unlock(&sdp->sd_freeze_mutex);
>   	deactivate_super(sb);
> -	clear_bit_unlock(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
> -	wake_up_bit(&sdp->sd_flags, SDF_FREEZE_INITIATOR);
> -	return;
> +out:
> +	if (error)
> +		fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n", error);
>   }
>   
>   /**
> @@ -707,21 +772,27 @@ static int gfs2_freeze_super(struct super_block *sb)
>   	struct gfs2_sbd *sdp = sb->s_fs_info;
>   	int error;
>   
> -	mutex_lock(&sdp->sd_freeze_mutex);
> -	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN) {
> -		error = -EBUSY;
> +	if (!mutex_trylock(&sdp->sd_freeze_mutex))
> +		return -EBUSY;
> +	error = -EBUSY;
> +	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
>   		goto out;
> -	}
>   
>   	for (;;) {
> -		if (gfs2_withdrawn(sdp)) {
> -			error = -EINVAL;
> +		error = gfs2_freeze_locally(sdp);
> +		if (error) {
> +			fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n",
> +				error);
>   			goto out;
>   		}
>   
>   		error = gfs2_lock_fs_check_clean(sdp);
>   		if (!error)
> -			break;
> +			break;  /* success */
> +
> +		error = gfs2_do_thaw(sdp);
> +		if (error)
> +			goto out;
>   
>   		if (error == -EBUSY)
>   			fs_err(sdp, "waiting for recovery before freeze\n");
> @@ -735,8 +806,12 @@ static int gfs2_freeze_super(struct super_block *sb)
>   		fs_err(sdp, "retrying...\n");
>   		msleep(1000);
>   	}
> -	set_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
> +
>   out:
> +	if (!error) {
> +		set_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
> +		atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
> +	}
>   	mutex_unlock(&sdp->sd_freeze_mutex);
>   	return error;
>   }
> @@ -750,17 +825,47 @@ static int gfs2_freeze_super(struct super_block *sb)
>   static int gfs2_thaw_super(struct super_block *sb)
>   {
>   	struct gfs2_sbd *sdp = sb->s_fs_info;
> +	int error;
>   
> -	mutex_lock(&sdp->sd_freeze_mutex);
> -	if (atomic_read(&sdp->sd_freeze_state) != SFS_FROZEN ||
> -	    !gfs2_holder_initialized(&sdp->sd_freeze_gh)) {
> -		mutex_unlock(&sdp->sd_freeze_mutex);
> -		return -EINVAL;
> +	if (!mutex_trylock(&sdp->sd_freeze_mutex))
> +		return -EBUSY;
> +	error = -EINVAL;
> +	if (!test_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags))
> +		goto out;
> +
> +	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
> +
> +	error = gfs2_do_thaw(sdp);
> +
> +	if (!error) {
> +		clear_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
> +		atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
>   	}
> +out:
> +	mutex_unlock(&sdp->sd_freeze_mutex);
> +	return error;
> +}
> +
> +void gfs2_thaw_freeze_initiator(struct super_block *sb)
> +{
> +	struct gfs2_sbd *sdp = sb->s_fs_info;
> +
> +	mutex_lock(&sdp->sd_freeze_mutex);
> +	if (!test_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags))
> +		goto out;
>   
>   	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
> +#if 0
> +	int error;
> +	error = thaw_super(sb);
> +	if (error)
> +		fs_info(sdp, "GFS2: couldn't thaw filesystem: %d\n", error);
> +	clear_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
> +	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
> +#endif

Can be removed.

Andy

> +
> +out:
>   	mutex_unlock(&sdp->sd_freeze_mutex);
> -	return wait_on_bit(&sdp->sd_flags, SDF_FREEZE_INITIATOR, TASK_INTERRUPTIBLE);
>   }
>   
>   /**
> diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
> index 58d13fd77aed..bba58629bc45 100644
> --- a/fs/gfs2/super.h
> +++ b/fs/gfs2/super.h
> @@ -46,6 +46,7 @@ extern void gfs2_statfs_change_out(const struct gfs2_statfs_change_host *sc,
>   extern void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh);
>   extern int gfs2_statfs_sync(struct super_block *sb, int type);
>   extern void gfs2_freeze_func(struct work_struct *work);
> +extern void gfs2_thaw_freeze_initiator(struct super_block *sb);
>   
>   extern void free_local_statfs_inodes(struct gfs2_sbd *sdp);
>   extern struct inode *find_local_statfs_inode(struct gfs2_sbd *sdp,
> diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
> index 1743caee5505..00494dffb47c 100644
> --- a/fs/gfs2/util.c
> +++ b/fs/gfs2/util.c
> @@ -124,7 +124,6 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
>   	struct gfs2_inode *ip;
>   	struct gfs2_glock *i_gl;
>   	u64 no_formal_ino;
> -	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>   	int ret = 0;
>   	int tries;
>   
> @@ -152,24 +151,18 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
>   	 */
>   	clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>   	if (!sb_rdonly(sdp->sd_vfs)) {
> -		struct gfs2_holder freeze_gh;
> -
> -		gfs2_holder_mark_uninitialized(&freeze_gh);
> -		if (sdp->sd_freeze_gl &&
> -		    !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
> -			ret = gfs2_freeze_lock_shared(sdp, &freeze_gh,
> -					log_write_allowed ? 0 : LM_FLAG_TRY);
> -			if (ret == GLR_TRYFAILED)
> -				ret = 0;
> -		}
> -		if (!ret)
> -			gfs2_make_fs_ro(sdp);
> +		bool locked = mutex_trylock(&sdp->sd_freeze_mutex);
> +
> +		gfs2_make_fs_ro(sdp);
> +
> +		if (locked)
> +			mutex_unlock(&sdp->sd_freeze_mutex);
> +
>   		/*
>   		 * Dequeue any pending non-system glock holders that can no
>   		 * longer be granted because the file system is withdrawn.
>   		 */
>   		gfs2_gl_dq_holders(sdp);
> -		gfs2_freeze_unlock(&freeze_gh);
>   	}
>   
>   	if (sdp->sd_lockstruct.ls_ops->lm_lock == NULL) { /* lock_nolock */
> @@ -187,15 +180,8 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
>   	}
>   	sdp->sd_jinode_gh.gh_flags |= GL_NOCACHE;
>   	gfs2_glock_dq(&sdp->sd_jinode_gh);
> -	if (test_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags)) {
> -		/* Make sure gfs2_thaw_super works if partially-frozen */
> -		flush_work(&sdp->sd_freeze_work);
> -		atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
> -		thaw_super(sdp->sd_vfs);
> -	} else {
> -		wait_on_bit(&i_gl->gl_flags, GLF_DEMOTE,
> -			    TASK_UNINTERRUPTIBLE);
> -	}
> +	gfs2_thaw_freeze_initiator(sdp->sd_vfs);
> +	wait_on_bit(&i_gl->gl_flags, GLF_DEMOTE, TASK_UNINTERRUPTIBLE);
>   
>   	/*
>   	 * holder_uninit to force glock_put, to force dlm to let go

