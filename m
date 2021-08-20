Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB5B3F2947
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 11:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629452157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iOshKb+VI6w5HeR93LIwfnAK1TNKUlOuLigWenEisc0=;
	b=htiu2Je5XlxQazsWhcn+vz7j7k1onHJIezTRNTubb8T2TnZAiHBv8tNim6xCSEAQZmeMPt
	n/dV30MGwrlX2Koxs3a4Mrc53aBwPmqXJqiQtW1p+zh0iCPNRPDpjeul+AaQD+sPHNBKLO
	/uuoHsIRue3kZpMV/4WYE6NXhvsqhdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-TCWTAe-9P-SsQyG7ajl86A-1; Fri, 20 Aug 2021 05:35:56 -0400
X-MC-Unique: TCWTAe-9P-SsQyG7ajl86A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AF868799EE;
	Fri, 20 Aug 2021 09:35:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3001527C24;
	Fri, 20 Aug 2021 09:35:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 946914BB7C;
	Fri, 20 Aug 2021 09:35:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17K9ZiPd027046 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 05:35:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B11F20A8C5B; Fri, 20 Aug 2021 09:35:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2661A20A8DC5
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 09:35:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 102CC866DF1
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 09:35:40 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
	[209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-123-zP3iNy48O26NuRgviCAXyg-1; Fri, 20 Aug 2021 05:35:38 -0400
X-MC-Unique: zP3iNy48O26NuRgviCAXyg-1
Received: by mail-ed1-f71.google.com with SMTP id
	ec47-20020a0564020d6fb02903be5e0a8cd2so4278671edb.0
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 02:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=iOshKb+VI6w5HeR93LIwfnAK1TNKUlOuLigWenEisc0=;
	b=gqP818K4y/klLJgGKMYYUQ6JFKMr4wqe85+lNU2Lu5vh8Jd8suwuWJVznrQPNNkMmJ
	7jRZJrt19bK8Ple1k4cHLwZ7nHD0SJNTwDDDaJAcuohi00PWFyay+BMPw7FLVP1foV5c
	2lCvuPogqvvuX7gH3sAwY8T4bK6MK+5Ouz2eOjfWCk6FeDYV2tI1T9kk+DRXqzcQIxyt
	DilU+s5J2+0dE/XLrnwlmwKzdVBrY9VD5onGx9vkTpWT3bcpKXK3o7DdnY8LMwcJ1nwS
	QOYXYrYuhmGPJEO0eBxNjVtO8pLVy9gxXT//AxBIUQz7hHssmOseDfFh4EL5rmYlB1JO
	PX/A==
X-Gm-Message-State: AOAM532QVVS/JDtqr1FG5xTB9liNlvA8G0oTGgQEvC86/X54QYVUohll
	03pgQaNOFN7FLhC+QiwmkjiY8sVNFUgGUo3YC/SqurbEd9uL3Iu+3Ll0+nYOdGnvR6eFrN8ycxC
	YufcCxf4wNMb8vPRnota8MA==
X-Received: by 2002:a17:906:1bb1:: with SMTP id
	r17mr20835809ejg.533.1629452137352; 
	Fri, 20 Aug 2021 02:35:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU0BYwDp21JOo3XDG4R7Z+3mBDO0R4qJcJcDV9AMMuqy6tXSCow7q67PuA08Xb9jrEh8Fr7Q==
X-Received: by 2002:a17:906:1bb1:: with SMTP id
	r17mr20835768ejg.533.1629452136959; 
	Fri, 20 Aug 2021 02:35:36 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id r2sm3242450edv.78.2021.08.20.02.35.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Aug 2021 02:35:36 -0700 (PDT)
Message-ID: <5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Fri, 20 Aug 2021 10:35:35 +0100
In-Reply-To: <20210819194102.1491495-11-agruenba@redhat.com>
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 10/19] gfs2: Introduce flag for glock
 holder auto-demotion
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2021-08-19 at 21:40 +0200, Andreas Gruenbacher wrote:
> From: Bob Peterson <rpeterso@redhat.com>
> 
> This patch introduces a new HIF_MAY_DEMOTE flag and infrastructure
> that
> will allow glocks to be demoted automatically on locking conflicts.
> When a locking request comes in that isn't compatible with the
> locking
> state of a holder and that holder has the HIF_MAY_DEMOTE flag set,
> the
> holder will be demoted automatically before the incoming locking
> request
> is granted.
> 
I'm not sure I understand what is going on here. When there are locking
conflicts we generate call backs and those result in glock demotion.
There is no need for a flag to indicate that I think, since it is the
default behaviour anyway. Or perhaps the explanation is just a bit
confusing...

> Processes that allow a glock holder to be taken away indicate this by
> calling gfs2_holder_allow_demote().  When they need the glock again,
> they call gfs2_holder_disallow_demote() and then they check if the
> holder is still queued: if it is, they're still holding the glock; if
> it
> isn't, they need to re-acquire the glock.
> 
> This allows processes to hang on to locks that could become part of a
> cyclic locking dependency.  The locks will be given up when a (rare)
> conflicting locking request occurs, and don't need to be given up
> prematurely.
This seems backwards to me. We already have the glock layer cache the
locks until they are required by another node. We also have the min
hold time to make sure that we don't bounce locks too much. So what is
the problem that you are trying to solve here I wonder?

> 
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glock.c  | 221 +++++++++++++++++++++++++++++++++++++++----
> ----
>  fs/gfs2/glock.h  |  20 +++++
>  fs/gfs2/incore.h |   1 +
>  3 files changed, 206 insertions(+), 36 deletions(-)
> 
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index f24db2ececfb..d1b06a09ce2f 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -58,6 +58,7 @@ struct gfs2_glock_iter {
>  typedef void (*glock_examiner) (struct gfs2_glock * gl);
>  
>  static void do_xmote(struct gfs2_glock *gl, struct gfs2_holder *gh,
> unsigned int target);
> +static void __gfs2_glock_dq(struct gfs2_holder *gh);
>  
>  static struct dentry *gfs2_root;
>  static struct workqueue_struct *glock_workqueue;
> @@ -197,6 +198,12 @@ static int demote_ok(const struct gfs2_glock
> *gl)
>  
>  	if (gl->gl_state == LM_ST_UNLOCKED)
>  		return 0;
> +	/*
> +	 * Note that demote_ok is used for the lru process of disposing
> of
> +	 * glocks. For this purpose, we don't care if the glock's
> holders
> +	 * have the HIF_MAY_DEMOTE flag set or not. If someone is using
> +	 * them, don't demote.
> +	 */
>  	if (!list_empty(&gl->gl_holders))
>  		return 0;
>  	if (glops->go_demote_ok)
> @@ -379,7 +386,7 @@ static void do_error(struct gfs2_glock *gl, const
> int ret)
>  	struct gfs2_holder *gh, *tmp;
>  
>  	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
> -		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
> +		if (!test_bit(HIF_WAIT, &gh->gh_iflags))
>  			continue;
>  		if (ret & LM_OUT_ERROR)
>  			gh->gh_error = -EIO;
> @@ -393,6 +400,40 @@ static void do_error(struct gfs2_glock *gl,
> const int ret)
>  	}
>  }
>  
> +/**
> + * demote_incompat_holders - demote incompatible demoteable holders
> + * @gl: the glock we want to promote
> + * @new_gh: the new holder to be promoted
> + */
> +static void demote_incompat_holders(struct gfs2_glock *gl,
> +				    struct gfs2_holder *new_gh)
> +{
> +	struct gfs2_holder *gh;
> +
> +	/*
> +	 * Demote incompatible holders before we make ourselves
> eligible.
> +	 * (This holder may or may not allow auto-demoting, but we
> don't want
> +	 * to demote the new holder before it's even granted.)
> +	 */
> +	list_for_each_entry(gh, &gl->gl_holders, gh_list) {
> +		/*
> +		 * Since holders are at the front of the list, we stop
> when we
> +		 * find the first non-holder.
> +		 */
> +		if (!test_bit(HIF_HOLDER, &gh->gh_iflags))
> +			return;
> +		if (test_bit(HIF_MAY_DEMOTE, &gh->gh_iflags) &&
> +		    !may_grant(gl, new_gh, gh)) {
> +			/*
> +			 * We should not recurse into do_promote
> because
> +			 * __gfs2_glock_dq only calls handle_callback,
> +			 * gfs2_glock_add_to_lru and
> __gfs2_glock_queue_work.
> +			 */
> +			__gfs2_glock_dq(gh);
> +		}
> +	}
> +}
> +
>  /**
>   * find_first_holder - find the first "holder" gh
>   * @gl: the glock
> @@ -411,6 +452,26 @@ static inline struct gfs2_holder
> *find_first_holder(const struct gfs2_glock *gl)
>  	return NULL;
>  }
>  
> +/**
> + * find_first_strong_holder - find the first non-demoteable holder
> + * @gl: the glock
> + *
> + * Find the first holder that doesn't have the HIF_MAY_DEMOTE flag
> set.
> + */
> +static inline struct gfs2_holder
> +*find_first_strong_holder(struct gfs2_glock *gl)
> +{
> +	struct gfs2_holder *gh;
> +
> +	list_for_each_entry(gh, &gl->gl_holders, gh_list) {
> +		if (!test_bit(HIF_HOLDER, &gh->gh_iflags))
> +			return NULL;
> +		if (!test_bit(HIF_MAY_DEMOTE, &gh->gh_iflags))
> +			return gh;
> +	}
> +	return NULL;
> +}
> +
>  /**
>   * do_promote - promote as many requests as possible on the current
> queue
>   * @gl: The glock
> @@ -425,15 +486,27 @@ __acquires(&gl->gl_lockref.lock)
>  {
>  	const struct gfs2_glock_operations *glops = gl->gl_ops;
>  	struct gfs2_holder *gh, *tmp, *first_gh;
> +	bool incompat_holders_demoted = false;
>  	int ret;
>  
> -	first_gh = find_first_holder(gl);
> +	first_gh = find_first_strong_holder(gl);
>  
>  restart:
>  	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
> -		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
> +		if (!test_bit(HIF_WAIT, &gh->gh_iflags))
>  			continue;
>  		if (may_grant(gl, first_gh, gh)) {
> +			if (!incompat_holders_demoted) {
> +				demote_incompat_holders(gl, first_gh);
> +				incompat_holders_demoted = true;
> +				first_gh = gh;
> +			}
> +			/*
> +			 * The first holder (and only the first holder)
> on the
> +			 * list to be promoted needs to call the
> go_lock
> +			 * function. This does things like
> inode_refresh
> +			 * to read an inode from disk.
> +			 */
>  			if (gh->gh_list.prev == &gl->gl_holders &&
>  			    glops->go_lock) {
>  				spin_unlock(&gl->gl_lockref.lock);
> @@ -459,6 +532,11 @@ __acquires(&gl->gl_lockref.lock)
>  			gfs2_holder_wake(gh);
>  			continue;
>  		}
> +		/*
> +		 * If we get here, it means we may not grant this
> holder for
> +		 * some reason. If this holder is the head of the list,
> it
> +		 * means we have a blocked holder at the head, so
> return 1.
> +		 */
>  		if (gh->gh_list.prev == &gl->gl_holders)
>  			return 1;
>  		do_error(gl, 0);
> @@ -1373,7 +1451,7 @@ __acquires(&gl->gl_lockref.lock)
>  		if (test_bit(GLF_LOCK, &gl->gl_flags)) {
>  			struct gfs2_holder *first_gh;
>  
> -			first_gh = find_first_holder(gl);
> +			first_gh = find_first_strong_holder(gl);
>  			try_futile = !may_grant(gl, first_gh, gh);
>  		}
>  		if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl-
> >gl_flags))
> @@ -1382,7 +1460,8 @@ __acquires(&gl->gl_lockref.lock)
>  
>  	list_for_each_entry(gh2, &gl->gl_holders, gh_list) {
>  		if (unlikely(gh2->gh_owner_pid == gh->gh_owner_pid &&
> -		    (gh->gh_gl->gl_ops->go_type != LM_TYPE_FLOCK)))
> +		    (gh->gh_gl->gl_ops->go_type != LM_TYPE_FLOCK) &&
> +		    !test_bit(HIF_MAY_DEMOTE, &gh2->gh_iflags)))
>  			goto trap_recursive;
>  		if (try_futile &&
>  		    !(gh2->gh_flags & (LM_FLAG_TRY | LM_FLAG_TRY_1CB)))
> {
> @@ -1478,51 +1557,83 @@ int gfs2_glock_poll(struct gfs2_holder *gh)
>  	return test_bit(HIF_WAIT, &gh->gh_iflags) ? 0 : 1;
>  }
>  
> -/**
> - * gfs2_glock_dq - dequeue a struct gfs2_holder from a glock
> (release a glock)
> - * @gh: the glock holder
> - *
> - */
> +static inline bool needs_demote(struct gfs2_glock *gl)
> +{
> +	return (test_bit(GLF_DEMOTE, &gl->gl_flags) ||
> +		test_bit(GLF_PENDING_DEMOTE, &gl->gl_flags));
> +}
>  
> -void gfs2_glock_dq(struct gfs2_holder *gh)
> +static void __gfs2_glock_dq(struct gfs2_holder *gh)
>  {
>  	struct gfs2_glock *gl = gh->gh_gl;
>  	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
>  	unsigned delay = 0;
>  	int fast_path = 0;
>  
> -	spin_lock(&gl->gl_lockref.lock);
>  	/*
> -	 * If we're in the process of file system withdraw, we cannot
> just
> -	 * dequeue any glocks until our journal is recovered, lest we
> -	 * introduce file system corruption. We need two exceptions to
> this
> -	 * rule: We need to allow unlocking of nondisk glocks and the
> glock
> -	 * for our own journal that needs recovery.
> +	 * This while loop is similar to function
> demote_incompat_holders:
> +	 * If the glock is due to be demoted (which may be from another
> node
> +	 * or even if this holder is GL_NOCACHE), the weak holders are
> +	 * demoted as well, allowing the glock to be demoted.
>  	 */
> -	if (test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags) &&
> -	    glock_blocked_by_withdraw(gl) &&
> -	    gh->gh_gl != sdp->sd_jinode_gl) {
> -		sdp->sd_glock_dqs_held++;
> -		spin_unlock(&gl->gl_lockref.lock);
> -		might_sleep();
> -		wait_on_bit(&sdp->sd_flags, SDF_WITHDRAW_RECOVERY,
> -			    TASK_UNINTERRUPTIBLE);
> -		spin_lock(&gl->gl_lockref.lock);
> -	}
> -	if (gh->gh_flags & GL_NOCACHE)
> -		handle_callback(gl, LM_ST_UNLOCKED, 0, false);
> +	while (gh) {
> +		/*
> +		 * If we're in the process of file system withdraw, we
> cannot
> +		 * just dequeue any glocks until our journal is
> recovered, lest
> +		 * we introduce file system corruption. We need two
> exceptions
> +		 * to this rule: We need to allow unlocking of nondisk
> glocks
> +		 * and the glock for our own journal that needs
> recovery.
> +		 */
> +		if (test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags) &&
> +		    glock_blocked_by_withdraw(gl) &&
> +		    gh->gh_gl != sdp->sd_jinode_gl) {
> +			sdp->sd_glock_dqs_held++;
> +			spin_unlock(&gl->gl_lockref.lock);
> +			might_sleep();
> +			wait_on_bit(&sdp->sd_flags,
> SDF_WITHDRAW_RECOVERY,
> +				    TASK_UNINTERRUPTIBLE);
> +			spin_lock(&gl->gl_lockref.lock);
> +		}
> +
> +		/*
> +		 * This holder should not be cached, so mark it for
> demote.
> +		 * Note: this should be done before the check for
> needs_demote
> +		 * below.
> +		 */
> +		if (gh->gh_flags & GL_NOCACHE)
> +			handle_callback(gl, LM_ST_UNLOCKED, 0, false);
>  
> -	list_del_init(&gh->gh_list);
> -	clear_bit(HIF_HOLDER, &gh->gh_iflags);
> -	if (list_empty(&gl->gl_holders) &&
> -	    !test_bit(GLF_PENDING_DEMOTE, &gl->gl_flags) &&
> -	    !test_bit(GLF_DEMOTE, &gl->gl_flags))
> -		fast_path = 1;
> +		list_del_init(&gh->gh_list);
> +		clear_bit(HIF_HOLDER, &gh->gh_iflags);
> +		trace_gfs2_glock_queue(gh, 0);
> +
> +		/*
> +		 * If there hasn't been a demote request we are done.
> +		 * (Let the remaining holders, if any, keep holding
> it.)
> +		 */
> +		if (!needs_demote(gl)) {
> +			if (list_empty(&gl->gl_holders))
> +				fast_path = 1;
> +			break;
> +		}
> +		/*
> +		 * If we have another strong holder (we cannot auto-
> demote)
> +		 * we are done. It keeps holding it until it is done.
> +		 */
> +		if (find_first_strong_holder(gl))
> +			break;
> +
> +		/*
> +		 * If we have a weak holder at the head of the list, it
> +		 * (and all others like it) must be auto-demoted. If
> there
> +		 * are no more weak holders, we exit the while loop.
> +		 */
> +		gh = find_first_holder(gl);
> +	}
>  
>  	if (!test_bit(GLF_LFLUSH, &gl->gl_flags) && demote_ok(gl))
>  		gfs2_glock_add_to_lru(gl);
>  
> -	trace_gfs2_glock_queue(gh, 0);
>  	if (unlikely(!fast_path)) {
>  		gl->gl_lockref.count++;
>  		if (test_bit(GLF_PENDING_DEMOTE, &gl->gl_flags) &&
> @@ -1531,6 +1642,19 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
>  			delay = gl->gl_hold_time;
>  		__gfs2_glock_queue_work(gl, delay);
>  	}
> +}
> +
> +/**
> + * gfs2_glock_dq - dequeue a struct gfs2_holder from a glock
> (release a glock)
> + * @gh: the glock holder
> + *
> + */
> +void gfs2_glock_dq(struct gfs2_holder *gh)
> +{
> +	struct gfs2_glock *gl = gh->gh_gl;
> +
> +	spin_lock(&gl->gl_lockref.lock);
> +	__gfs2_glock_dq(gh);
>  	spin_unlock(&gl->gl_lockref.lock);
>  }
>  
> @@ -1693,6 +1817,7 @@ void gfs2_glock_dq_m(unsigned int num_gh,
> struct gfs2_holder *ghs)
>  
>  void gfs2_glock_cb(struct gfs2_glock *gl, unsigned int state)
>  {
> +	struct gfs2_holder mock_gh = { .gh_gl = gl, .gh_state = state,
> };
>  	unsigned long delay = 0;
>  	unsigned long holdtime;
>  	unsigned long now = jiffies;
> @@ -1707,6 +1832,28 @@ void gfs2_glock_cb(struct gfs2_glock *gl,
> unsigned int state)
>  		if (test_bit(GLF_REPLY_PENDING, &gl->gl_flags))
>  			delay = gl->gl_hold_time;
>  	}
> +	/*
> +	 * Note 1: We cannot call demote_incompat_holders from
> handle_callback
> +	 * or gfs2_set_demote due to recursion problems like:
> gfs2_glock_dq ->
> +	 * handle_callback -> demote_incompat_holders -> gfs2_glock_dq
> +	 * Plus, we only want to demote the holders if the request
> comes from
> +	 * a remote cluster node because local holder conflicts are
> resolved
> +	 * elsewhere.
> +	 *
> +	 * Note 2: if a remote node wants this glock in EX mode,
> lock_dlm will
> +	 * request that we set our state to UNLOCKED. Here we mock up a
> holder
> +	 * to make it look like someone wants the lock EX locally. Any
> SH
> +	 * and DF requests should be able to share the lock without
> demoting.
> +	 *
> +	 * Note 3: We only want to demote the demoteable holders when
> there
> +	 * are no more strong holders. The demoteable holders might as
> well
> +	 * keep the glock until the last strong holder is done with it.
> +	 */
> +	if (!find_first_strong_holder(gl)) {
> +		if (state == LM_ST_UNLOCKED)
> +			mock_gh.gh_state = LM_ST_EXCLUSIVE;
> +		demote_incompat_holders(gl, &mock_gh);
> +	}
>  	handle_callback(gl, state, delay, true);
>  	__gfs2_glock_queue_work(gl, delay);
>  	spin_unlock(&gl->gl_lockref.lock);
> @@ -2096,6 +2243,8 @@ static const char *hflags2str(char *buf, u16
> flags, unsigned long iflags)
>  		*p++ = 'H';
>  	if (test_bit(HIF_WAIT, &iflags))
>  		*p++ = 'W';
> +	if (test_bit(HIF_MAY_DEMOTE, &iflags))
> +		*p++ = 'D';
>  	*p = 0;
>  	return buf;
>  }
> diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
> index 31a8f2f649b5..9012487da4c6 100644
> --- a/fs/gfs2/glock.h
> +++ b/fs/gfs2/glock.h
> @@ -150,6 +150,8 @@ static inline struct gfs2_holder
> *gfs2_glock_is_locked_by_me(struct gfs2_glock *
>  	list_for_each_entry(gh, &gl->gl_holders, gh_list) {
>  		if (!test_bit(HIF_HOLDER, &gh->gh_iflags))
>  			break;
> +		if (test_bit(HIF_MAY_DEMOTE, &gh->gh_iflags))
> +			continue;
>  		if (gh->gh_owner_pid == pid)
>  			goto out;
>  	}
> @@ -325,6 +327,24 @@ static inline void glock_clear_object(struct
> gfs2_glock *gl, void *object)
>  	spin_unlock(&gl->gl_lockref.lock);
>  }
>  
> +static inline void gfs2_holder_allow_demote(struct gfs2_holder *gh)
> +{
> +	struct gfs2_glock *gl = gh->gh_gl;
> +
> +	spin_lock(&gl->gl_lockref.lock);
> +	set_bit(HIF_MAY_DEMOTE, &gh->gh_iflags);
> +	spin_unlock(&gl->gl_lockref.lock);
> +}
> +
> +static inline void gfs2_holder_disallow_demote(struct gfs2_holder
> *gh)
> +{
> +	struct gfs2_glock *gl = gh->gh_gl;
> +
> +	spin_lock(&gl->gl_lockref.lock);
> +	clear_bit(HIF_MAY_DEMOTE, &gh->gh_iflags);
> +	spin_unlock(&gl->gl_lockref.lock);
> +}
> +
This looks a bit strange... bit operations are atomic anyway, so why do
we need that spinlock here?

Steve.

>  extern void gfs2_inode_remember_delete(struct gfs2_glock *gl, u64
> generation);
>  extern bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64
> generation);
>  
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 5c6b985254aa..e73a81db0714 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -252,6 +252,7 @@ struct gfs2_lkstats {
>  
>  enum {
>  	/* States */
> +	HIF_MAY_DEMOTE		= 1,
>  	HIF_HOLDER		= 6,  /* Set for gh that "holds" the
> glock */
>  	HIF_WAIT		= 10,
>  };

