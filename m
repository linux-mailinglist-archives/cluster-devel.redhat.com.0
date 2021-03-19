Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB85341C02
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Mar 2021 13:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616156023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MFeNphQirvui1PbZXyMP/xM1BExaqvmkTx+W4l0PAwA=;
	b=U5UXzX3MpgvBRYltst1O9sVfrAvsD92ElJkZBX5FzjCUrzgiqBkiDzzjN5y1FSFXSfrdez
	BhrzSHPJQVpZfgZt9LvU3tC3Vyg5pr5u2JUFsumGYZR5Q1cv3ZX6ok0KyXCQ+k4nDOkQnq
	HaNHbSONgMRz+8/hN8APc0LkSWCUJfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-1XbrGMWJNkG3c0DNeC_9MQ-1; Fri, 19 Mar 2021 08:13:41 -0400
X-MC-Unique: 1XbrGMWJNkG3c0DNeC_9MQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F5E010866A3;
	Fri, 19 Mar 2021 12:13:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3DC610F1;
	Fri, 19 Mar 2021 12:13:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F36A4BB7C;
	Fri, 19 Mar 2021 12:13:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JCDZTg008374 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 08:13:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27A785C27C; Fri, 19 Mar 2021 12:13:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.57])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 477FA5C1BB;
	Fri, 19 Mar 2021 12:13:30 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <720686359.64750132.1616155577098.JavaMail.zimbra@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <31cdea6d-6926-6f87-f8ab-6594a4a9e7c6@redhat.com>
Date: Fri, 19 Mar 2021 12:13:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <720686359.64750132.1616155577098.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Add new sysfs file for gfs2
 status
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 19/03/2021 12:06, Bob Peterson wrote:
> This patch adds a new file: /sys/fs/gfs2/*/status which will report
> the status of the file system. Catting this file dumps the current
> status of the file system according to various superblock variables.
> For example:
>
> Journal Checked:          1
> Journal Live:             1
> Journal ID:               0
> Spectator:                0
> Withdrawn:                0
> No barriers:              0
> No recovery:              0
> Demote:                   0
> No Journal ID:            1
> Mounted RO:               0
> RO Recovery:              0
> Skip DLM Unlock:          0
> Force AIL Flush:          0
> FS Frozen:                0
> Withdrawing:              0
> Withdraw In Prog:         0
> Remote Withdraw:          0
> Withdraw Recovery:        0
> sd_log_lock held:         0
> statfs_spin held:         0
> sd_rindex_spin:           0
> sd_jindex_spin:           0
> sd_trunc_lock:            0
> sd_bitmap_lock:           0
> sd_ordered_lock:          0
> sd_ail_lock:              0
> sd_log_error:             0
> sd_log_flush_lock:        0
> sd_log_num_revoke:        0
> sd_log_in_flight:         0
> sd_log_blks_needed:       0
> sd_log_blks_free:         32768
> sd_log_flush_head:        0
> sd_log_flush_tail:        5384
> sd_log_blks_reserved:     0
> sd_log_revokes_available: 503
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>

It looks like it might be missing some locking on some of those variables?

Steve.


> ---
>   fs/gfs2/sys.c | 83 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>
> diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
> index c3e72dba7418..57f53c13866e 100644
> --- a/fs/gfs2/sys.c
> +++ b/fs/gfs2/sys.c
> @@ -63,6 +63,87 @@ static ssize_t id_show(struct gfs2_sbd *sdp, char *buf)
>   			MAJOR(sdp->sd_vfs->s_dev), MINOR(sdp->sd_vfs->s_dev));
>   }
>   
> +static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
> +{
> +	unsigned long f = sdp->sd_flags;
> +	ssize_t s;
> +
> +	s = snprintf(buf, PAGE_SIZE,
> +		     "Journal Checked:          %d\n"
> +		     "Journal Live:             %d\n"
> +		     "Journal ID:               %d\n"
> +		     "Spectator:                %d\n"
> +		     "Withdrawn:                %d\n"
> +		     "No barriers:              %d\n"
> +		     "No recovery:              %d\n"
> +		     "Demote:                   %d\n"
> +		     "No Journal ID:            %d\n"
> +		     "Mounted RO:               %d\n"
> +		     "RO Recovery:              %d\n"
> +		     "Skip DLM Unlock:          %d\n"
> +		     "Force AIL Flush:          %d\n"
> +		     "FS Frozen:                %d\n"
> +		     "Withdrawing:              %d\n"
> +		     "Withdraw In Prog:         %d\n"
> +		     "Remote Withdraw:          %d\n"
> +		     "Withdraw Recovery:        %d\n"
> +		     "sd_log_lock held:         %d\n"
> +		     "statfs_spin held:         %d\n"
> +		     "sd_rindex_spin:           %d\n"
> +		     "sd_jindex_spin:           %d\n"
> +		     "sd_trunc_lock:            %d\n"
> +		     "sd_bitmap_lock:           %d\n"
> +		     "sd_ordered_lock:          %d\n"
> +		     "sd_ail_lock:              %d\n"
> +		     "sd_log_error:             %d\n"
> +		     "sd_log_flush_lock:        %d\n"
> +		     "sd_log_num_revoke:        %u\n"
> +		     "sd_log_in_flight:         %d\n"
> +		     "sd_log_blks_needed:       %d\n"
> +		     "sd_log_blks_free:         %d\n"
> +		     "sd_log_flush_head:        %d\n"
> +		     "sd_log_flush_tail:        %d\n"
> +		     "sd_log_blks_reserved:     %d\n"
> +		     "sd_log_revokes_available: %d\n",
> +		     test_bit(SDF_JOURNAL_CHECKED, &f),
> +		     test_bit(SDF_JOURNAL_LIVE, &f),
> +		     (sdp->sd_jdesc ? sdp->sd_jdesc->jd_jid : 0),
> +		     (sdp->sd_args.ar_spectator ? 1 : 0),
> +		     test_bit(SDF_WITHDRAWN, &f),
> +		     test_bit(SDF_NOBARRIERS, &f),
> +		     test_bit(SDF_NORECOVERY, &f),
> +		     test_bit(SDF_DEMOTE, &f),
> +		     test_bit(SDF_NOJOURNALID, &f),
> +		     (sb_rdonly(sdp->sd_vfs) ? 1 : 0),
> +		     test_bit(SDF_RORECOVERY, &f),
> +		     test_bit(SDF_SKIP_DLM_UNLOCK, &f),
> +		     test_bit(SDF_FORCE_AIL_FLUSH, &f),
> +		     test_bit(SDF_FS_FROZEN, &f),
> +		     test_bit(SDF_WITHDRAWING, &f),
> +		     test_bit(SDF_WITHDRAW_IN_PROG, &f),
> +		     test_bit(SDF_REMOTE_WITHDRAW, &f),
> +		     test_bit(SDF_WITHDRAW_RECOVERY, &f),
> +		     spin_is_locked(&sdp->sd_log_lock),
> +		     spin_is_locked(&sdp->sd_statfs_spin),
> +		     spin_is_locked(&sdp->sd_rindex_spin),
> +		     spin_is_locked(&sdp->sd_jindex_spin),
> +		     spin_is_locked(&sdp->sd_trunc_lock),
> +		     spin_is_locked(&sdp->sd_bitmap_lock),
> +		     spin_is_locked(&sdp->sd_ordered_lock),
> +		     spin_is_locked(&sdp->sd_ail_lock),
> +		     sdp->sd_log_error,
> +		     rwsem_is_locked(&sdp->sd_log_flush_lock),
> +		     sdp->sd_log_num_revoke,
> +		     atomic_read(&sdp->sd_log_in_flight),
> +		     atomic_read(&sdp->sd_log_blks_needed),
> +		     atomic_read(&sdp->sd_log_blks_free),
> +		     sdp->sd_log_flush_head,
> +		     sdp->sd_log_flush_tail,
> +		     sdp->sd_log_blks_reserved,
> +		     atomic_read(&sdp->sd_log_revokes_available));
> +	return s;
> +}
> +
>   static ssize_t fsname_show(struct gfs2_sbd *sdp, char *buf)
>   {
>   	return snprintf(buf, PAGE_SIZE, "%s\n", sdp->sd_fsname);
> @@ -283,6 +364,7 @@ GFS2_ATTR(quota_sync,          0200, NULL,          quota_sync_store);
>   GFS2_ATTR(quota_refresh_user,  0200, NULL,          quota_refresh_user_store);
>   GFS2_ATTR(quota_refresh_group, 0200, NULL,          quota_refresh_group_store);
>   GFS2_ATTR(demote_rq,           0200, NULL,	    demote_rq_store);
> +GFS2_ATTR(status,              0444, status_show,   NULL);
>   
>   static struct attribute *gfs2_attrs[] = {
>   	&gfs2_attr_id.attr,
> @@ -295,6 +377,7 @@ static struct attribute *gfs2_attrs[] = {
>   	&gfs2_attr_quota_refresh_user.attr,
>   	&gfs2_attr_quota_refresh_group.attr,
>   	&gfs2_attr_demote_rq.attr,
> +	&gfs2_attr_status.attr,
>   	NULL,
>   };
>   ATTRIBUTE_GROUPS(gfs2);
>

