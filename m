Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 57B3924A4E5
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Aug 2020 19:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597858079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NF5+ElwaZ2PcMxM/oQzjSkQArIh6kAql2mO4mQ7/Ay4=;
	b=N706O5blpe4c+gLCOQUy4CGOpMKUzihbTxwf7j7h4NZY29t94OEDGb4AWusbbht5JJ28Ps
	5v+Zf1plafALPtvXceNzBQS4Z9rQ36a2neJZVlq9UflCppWzJ4vj5QCO8/eTWspYGcBSg7
	rTnx/04dPgEb2jGtZvZbufb7S54uKCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-xzhGzg7AOV6iBLWHQMa3ww-1; Wed, 19 Aug 2020 13:27:57 -0400
X-MC-Unique: xzhGzg7AOV6iBLWHQMa3ww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CC482FD00;
	Wed, 19 Aug 2020 17:27:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57E287BE98;
	Wed, 19 Aug 2020 17:27:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88BF060370;
	Wed, 19 Aug 2020 17:27:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JHRoLu018665 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 13:27:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C6097C0AC; Wed, 19 Aug 2020 17:27:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D9A57BE98;
	Wed, 19 Aug 2020 17:27:47 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 347C11832FC1;
	Wed, 19 Aug 2020 17:27:47 +0000 (UTC)
Date: Wed, 19 Aug 2020 13:27:47 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Abhi Das <adas@redhat.com>
Message-ID: <1768511629.12781656.1597858067052.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200813200114.5665-4-adas@redhat.com>
References: <20200813200114.5665-1-adas@redhat.com>
	<20200813200114.5665-4-adas@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.97, 10.4.195.20]
Thread-Topic: gfs2: Recover statfs info in journal head
Thread-Index: vDGPgl2YuWRRXz8sTlG/uC3aqME6uQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 3/3] gfs2: Recover statfs info in
 journal	head
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Apply the outstanding statfs changes in the journal head to the
> master statfs file. Zero out the local statfs file for good measure.
> 
> Signed-off-by: Abhi Das <adas@redhat.com>
> ---
>  fs/gfs2/lops.c     |   2 +-
>  fs/gfs2/lops.h     |   1 +
>  fs/gfs2/recovery.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 123 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 53d2dbf6605e..061747b959c8 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -831,7 +831,7 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd,
> u32 start,
>   *
>   */
>  
> -static void gfs2_meta_sync(struct gfs2_glock *gl)
> +void gfs2_meta_sync(struct gfs2_glock *gl)
>  {
>  	struct address_space *mapping = gfs2_glock2aspace(gl);
>  	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
> diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
> index 9c5e4e491e03..4a3d8aecdf82 100644
> --- a/fs/gfs2/lops.h
> +++ b/fs/gfs2/lops.h
> @@ -27,6 +27,7 @@ extern void gfs2_log_submit_bio(struct bio **biop, int
> opf);
>  extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
>  extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
>  			   struct gfs2_log_header_host *head, bool keep_cache);
> +extern void gfs2_meta_sync(struct gfs2_glock *gl);
>  
>  static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
>  {
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index a8bb17e355b8..428a0aad49c6 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -296,6 +296,126 @@ static void gfs2_recovery_done(struct gfs2_sbd *sdp,
> unsigned int jid,
>  		sdp->sd_lockstruct.ls_ops->lm_recovery_result(sdp, jid, message);
>  }
>  
> +static int lookup_statfs_inodes(struct gfs2_jdesc *jd, struct inode
> **master,
> +				struct inode **local)
> +{
> +	int error = 0;
> +	char buf[30];
> +	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
> +	struct inode *md = d_inode(sdp->sd_master_dir), *pn;
> +
> +	*master = gfs2_lookup_simple(md, "statfs");
> +	if (IS_ERR(*master)) {
> +		error = PTR_ERR(*master);
> +		fs_err(sdp, "Can't read in statfs inode: %d\n", error);
> +		goto out;
> +	}
> +	pn = gfs2_lookup_simple(md, "per_node");
> +	if (IS_ERR(pn)) {
> +		error = PTR_ERR(pn);
> +		fs_err(sdp, "Can't find per_node directory: %d\n", error);
> +		goto put_m_ip;
> +	}
> +	sprintf(buf, "statfs_change%u", jd->jd_jid);
> +	*local = gfs2_lookup_simple(pn, buf);
> +	if (IS_ERR(*local)) {
> +		error = PTR_ERR(*local);
> +		fs_err(sdp, "Can't find local \"sc\" file for jid:%u: %d\n",
> +		       jd->jd_jid, error);
> +	}
> +	iput(pn);
> +	if (!error)
> +		return error;
> +put_m_ip:
> +	iput(*master);
> +out:
> +	return error;
> +}
> +
> +static int update_statfs_inode(struct gfs2_jdesc *jd, struct gfs2_inode *ip,
> +			       struct gfs2_log_header_host *head)
> +{
> +	/*
> +	 * If head is NULL, ip points to a local statfs file.
> +	 * zero out the statfs data in the inode pointed to by ip.
> +	 */
> +	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
> +	struct gfs2_statfs_change_host sc;
> +	struct gfs2_holder gh;
> +	struct buffer_head *bh;
> +	int error = 0;
> +
> +	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_NOCACHE, &gh);
> +	if (error)
> +		goto out;
> +
> +	error = gfs2_meta_inode_buffer(ip, &bh);
> +	if (error)
> +		goto out_unlock;
> +
> +	spin_lock(&sdp->sd_statfs_spin);
> +	if (head) {
> +		gfs2_statfs_change_in(&sc, bh->b_data + sizeof(struct gfs2_dinode));
> +		sc.sc_total += head->lh_local_total;
> +		sc.sc_free += head->lh_local_free;
> +		sc.sc_dinodes += head->lh_local_dinodes;
> +		gfs2_statfs_change_out(&sc, bh->b_data + sizeof(struct gfs2_dinode));
> +		fs_info(sdp, "jid=%u: Updated master statfs Total:%lld, "
> +			"Free:%lld, Dinodes:%lld after change "
> +			"[%+lld,%+lld,%+lld]\n", jd->jd_jid, sc.sc_total,
> +			sc.sc_free, sc.sc_dinodes, head->lh_local_total,
> +			head->lh_local_free, head->lh_local_dinodes);
> +	} else {
> +		memset(bh->b_data + sizeof(struct gfs2_dinode), 0,
> +		       sizeof(struct gfs2_statfs_change));
> +		if (jd->jd_jid == sdp->sd_lockstruct.ls_jid) { /* This node's journal */
> +			sdp->sd_statfs_local.sc_total = 0;
> +			sdp->sd_statfs_local.sc_free = 0;
> +			sdp->sd_statfs_local.sc_dinodes = 0;
> +		}
> +	}
> +	spin_unlock(&sdp->sd_statfs_spin);
> +	mark_buffer_dirty(bh);
> +	brelse(bh);
> +	gfs2_meta_sync(ip->i_gl);
> +
> +out_unlock:
> +	gfs2_glock_dq_uninit(&gh);
> +out:
> +	return error;
> +}
> +
> +static void recover_local_statfs(struct gfs2_jdesc *jd,
> +				 struct gfs2_log_header_host *head)
> +{
> +	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
> +	struct inode *master = NULL, *local = NULL;
> +	int error;
> +
> +	if (!head->lh_local_total && !head->lh_local_free
> +	    && !head->lh_local_dinodes) /* No change */
> +		goto out;
> +
> +	error = lookup_statfs_inodes(jd, &master, &local);
> +	if (error)
> +		goto out;
> +	error = update_statfs_inode(jd, GFS2_I(master), head);
> +	if (error)
> +		goto iput_inodes;
> +	error = update_statfs_inode(jd, GFS2_I(local), NULL);
> +	if (error)
> +		goto iput_inodes;
> +	if (jd->jd_jid == sdp->sd_lockstruct.ls_jid)
> +		memset(&sdp->sd_statfs_local, 0,
> +		       sizeof(struct gfs2_statfs_change_host));
> +
> +iput_inodes:
> +	iput(master);
> +	iput(local);
> +out:
> +	return;
> +}
> +
>  void gfs2_recover_func(struct work_struct *work)
>  {
>  	struct gfs2_jdesc *jd = container_of(work, struct gfs2_jdesc, jd_work);
> @@ -415,6 +535,7 @@ void gfs2_recover_func(struct work_struct *work)
>  				goto fail_gunlock_thaw;
>  		}
>  
> +		recover_local_statfs(jd, &head);
>  		clean_journal(jd, &head);
>  		up_read(&sdp->sd_log_flush_lock);
>  
> --
> 2.20.1
> 
> 
Hi,

Why do we need to look up all these inodes?

Function init_inodes() looks up sd_statfs_inode and init_per_node() looks up
the statfs_changeX file, both of which are called pretty early during mount.

It seems to me sdp->sd_statfs_inode should already contain the master statfs
inode and sdp->sd_sc_inode should contain the current statfs_changeX inode
until unmount.

Of course, since the recover workqueue is initialized earlier, I'm guessing
maybe dlm can call gfs2 to do recovery before this initialization is done?
Maybe we can move the lookups prior to this or the workqueue after it?

It just seems like we can somehow avoid these lookups because they're done
elsewhere. But I haven't traced the code paths and you have, so maybe I'm
off base here.

Regards,

Bob Peterson

