Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 71B502E925D
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 10:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609751642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TWJ5QSZgcAbb+pTLsrzDwyXqbAVkKiVgh61KiwcPX8s=;
	b=Qm0hftvFuLxsbx+coPLA7TklVizIF3mRSkzLOjMlgC8Dvwd+UWngaAKvnqCOYY9UHRvzcO
	/13st4T9S8yEuspCesi9z9Nyy903/jNSYW3HdFBNCzyPphBglL7BzBQHJk+NjIxAHcGxOf
	Egd0zvr1EqcasH9yf90bTi1YYVWZjkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-qrKIQm63M3uhas2WB661cQ-1; Mon, 04 Jan 2021 04:14:00 -0500
X-MC-Unique: qrKIQm63M3uhas2WB661cQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F07195D578;
	Mon,  4 Jan 2021 09:13:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D433E60BE5;
	Mon,  4 Jan 2021 09:13:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09EEB1809C9F;
	Mon,  4 Jan 2021 09:13:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1049DnLn024473 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 04:13:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A58CC6F43C; Mon,  4 Jan 2021 09:13:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED94D72168
	for <cluster-devel@redhat.com>; Mon,  4 Jan 2021 09:13:48 +0000 (UTC)
To: cluster-devel@redhat.com
References: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <51252ca2-fa56-acb8-24cf-fb2e992f76de@redhat.com>
Date: Mon, 4 Jan 2021 09:13:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: make recovery workqueue
 operate on a gfs2 mount point, not journal
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 22/12/2020 20:38, Bob Peterson wrote:
> Hi,
>
> Before this patch, journal recovery was done by a workqueue function that
> operated on a per-journal basis. The problem is, these could run simultaneously
> which meant that they could all use the same bio, sd_log_bio, to do their
> writing to all the various journals. These operations overwrote one another
> eventually causing memory corruption.

Why not just add more bios so that this issue goes away? It would make 
more sense than preventing recovery from running in parallel. In general 
recovery should be spread amoung nodes anyway, so the case of having 
multiple recoveries running on the same node in parallel should be 
fairly rare too,

Steve.


>
> This patch makes the recovery workqueue operate on a per-superblock basis,
> which means a mount point using, for example journal0, could do recovery
> for all journals that need recovery. This is done consecutively so the
> sd_log_bio is only referenced by one recovery at a time, thus avoiding the
> chaos.
>
> Since the journal recovery requests can come in any order, and unpredictably,
> the new work func loops until there are no more journals to be recovered.
>
> Since multiple processes may request recovery of a journal, and since they
> all now use the same sdp-based workqueue, it's okay for them to get an
> error from queue_work: Queueing work while there's already work queued.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>   fs/gfs2/incore.h     |  2 +-
>   fs/gfs2/ops_fstype.c |  2 +-
>   fs/gfs2/recovery.c   | 32 ++++++++++++++++++++++++++++----
>   3 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 8e1ab8ed4abc..b393cbf9efeb 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -529,7 +529,6 @@ struct gfs2_jdesc {
>   	struct list_head jd_list;
>   	struct list_head extent_list;
>   	unsigned int nr_extents;
> -	struct work_struct jd_work;
>   	struct inode *jd_inode;
>   	unsigned long jd_flags;
>   #define JDF_RECOVERY 1
> @@ -746,6 +745,7 @@ struct gfs2_sbd {
>   	struct completion sd_locking_init;
>   	struct completion sd_wdack;
>   	struct delayed_work sd_control_work;
> +	struct work_struct sd_recovery_work;
>   
>   	/* Inode Stuff */
>   
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 61fce59cb4d3..3d9a6d6d42cb 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -93,6 +93,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
>   	init_completion(&sdp->sd_locking_init);
>   	init_completion(&sdp->sd_wdack);
>   	spin_lock_init(&sdp->sd_statfs_spin);
> +	INIT_WORK(&sdp->sd_recovery_work, gfs2_recover_func);
>   
>   	spin_lock_init(&sdp->sd_rindex_spin);
>   	sdp->sd_rindex_tree.rb_node = NULL;
> @@ -586,7 +587,6 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
>   		INIT_LIST_HEAD(&jd->extent_list);
>   		INIT_LIST_HEAD(&jd->jd_revoke_list);
>   
> -		INIT_WORK(&jd->jd_work, gfs2_recover_func);
>   		jd->jd_inode = gfs2_lookupi(sdp->sd_jindex, &name, 1);
>   		if (IS_ERR_OR_NULL(jd->jd_inode)) {
>   			if (!jd->jd_inode)
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index c26c68ebd29d..cd3e66cdb560 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -399,9 +399,8 @@ static void recover_local_statfs(struct gfs2_jdesc *jd,
>   	return;
>   }
>   
> -void gfs2_recover_func(struct work_struct *work)
> +static void gfs2_recover_one(struct gfs2_jdesc *jd)
>   {
> -	struct gfs2_jdesc *jd = container_of(work, struct gfs2_jdesc, jd_work);
>   	struct gfs2_inode *ip = GFS2_I(jd->jd_inode);
>   	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
>   	struct gfs2_log_header_host head;
> @@ -562,16 +561,41 @@ void gfs2_recover_func(struct work_struct *work)
>   	wake_up_bit(&jd->jd_flags, JDF_RECOVERY);
>   }
>   
> +void gfs2_recover_func(struct work_struct *work)
> +{
> +	struct gfs2_sbd *sdp = container_of(work, struct gfs2_sbd,
> +					    sd_recovery_work);
> +	struct gfs2_jdesc *jd;
> +	int count, recovered = 0;
> +
> +	do {
> +		count = 0;
> +		spin_lock(&sdp->sd_jindex_spin);
> +		list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
> +			if (test_bit(JDF_RECOVERY, &jd->jd_flags)) {
> +				spin_unlock(&sdp->sd_jindex_spin);
> +				gfs2_recover_one(jd);
> +				spin_lock(&sdp->sd_jindex_spin);
> +				count++;
> +				recovered++;
> +			}
> +		}
> +		spin_unlock(&sdp->sd_jindex_spin);
> +	} while (count);
> +	if (recovered > 1)
> +		fs_err(sdp, "Journals recovered: %d\n", recovered);
> +}
> +
>   int gfs2_recover_journal(struct gfs2_jdesc *jd, bool wait)
>   {
> +	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
>   	int rv;
>   
>   	if (test_and_set_bit(JDF_RECOVERY, &jd->jd_flags))
>   		return -EBUSY;
>   
>   	/* we have JDF_RECOVERY, queue should always succeed */
> -	rv = queue_work(gfs_recovery_wq, &jd->jd_work);
> -	BUG_ON(!rv);
> +	rv = queue_work(gfs_recovery_wq, &sdp->sd_recovery_work);
>   
>   	if (wait)
>   		wait_on_bit(&jd->jd_flags, JDF_RECOVERY,
>

