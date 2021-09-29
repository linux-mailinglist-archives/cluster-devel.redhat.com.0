Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 83F2741CA83
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Sep 2021 18:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632933790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+guk+cf2+ym3vIeSfOOx3l+6sgkoXK28rndmvuIU4PA=;
	b=R8aisw8J4O2MGcBRO/ARVMQx8cert2ljv/thvMmv8o3SiROqWHGAGkTCXJljqwVk8tnILh
	AScD93O3RDER+AFoTa5hhNrGVg0lu8BuSsuFaKigrywQ9Ex0kHl4c3BxdHLxOicArZyOn5
	yI6aQU900KODP52uRX7rZogM7mXseM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-DWsMk8PbM-ec4_to3II0kA-1; Wed, 29 Sep 2021 12:43:09 -0400
X-MC-Unique: DWsMk8PbM-ec4_to3II0kA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD4DA18125C2;
	Wed, 29 Sep 2021 16:43:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 745F860583;
	Wed, 29 Sep 2021 16:43:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E4104EA2F;
	Wed, 29 Sep 2021 16:43:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18TGgvVX025202 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 12:42:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFE27568E1; Wed, 29 Sep 2021 16:42:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D941730BAD
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 16:42:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A87C9899ED3
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 16:42:53 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-443-Vp2BnxAeN9mMnMpoZO-FDA-1; Wed, 29 Sep 2021 12:42:51 -0400
X-MC-Unique: Vp2BnxAeN9mMnMpoZO-FDA-1
Received: by mail-wm1-f71.google.com with SMTP id
	r2-20020a7bc082000000b0030d2ab5c3a7so53963wmh.1
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 09:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+guk+cf2+ym3vIeSfOOx3l+6sgkoXK28rndmvuIU4PA=;
	b=RB0+hTN+Oi5IrG/UY5U5mE6p9j+/E5aXOxL71TYmNvMNgGu/zLL+ZF3ATnm27ZK5On
	ThyjCezh5lmFByUuz053sk2zaGYWhB/pXU5tHrZAhnXTjVA1bgtFM2qBdSVy8rhs++pF
	TsM37n2hRNpuKFcSolcO8ZJVrcXoE5lL3y6M4I5Dgb3u4RQVHwSHDzQxUGT/xdmNrSWF
	eG2Sn4kE8oTxZbumzEADEwtf4aEhrp1C3Bib4uq+mpTa5DGyzP703p7mzn3RAOIH5h5S
	nJeu0YJB0o/nNEbat8ibB8pAo/Gm3f/0YcrqwYNEa4DJ9iQqVYOmMeOUtM0YpkZC6sGT
	3AQw==
X-Gm-Message-State: AOAM531kfMOKhUwsfTcW6LXBKcanQrxA/PADjsAo2R9RMz7/JDHh87Ij
	+uG6PaIzRKjjE0T0Zt0mSL4DpWvYQBwf+eV1+qiQlpNSRc+z3panvRuImchXoFBXVbMWCmEy3n+
	1FymWeZa3Vc1VhgNuoNVIkImQi4UyEBh48N+r7w==
X-Received: by 2002:adf:e309:: with SMTP id b9mr1013027wrj.81.1632933769817;
	Wed, 29 Sep 2021 09:42:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjC4eWNMjwCwqpmsuNEUoeBxXaf9duq4i+1rFZ4ksPhrWlvIuRISi1vNHwGnNNpqFr+s3X3u7+k3PD/05YXYA=
X-Received: by 2002:adf:e309:: with SMTP id b9mr1012976wrj.81.1632933769267;
	Wed, 29 Sep 2021 09:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210929132103.192481-1-rpeterso@redhat.com>
	<CAHc6FU7E7hdskzdnyqT1SgVzfGJ=p9NiFR5KDK-i+dDZKF8R4g@mail.gmail.com>
In-Reply-To: <CAHc6FU7E7hdskzdnyqT1SgVzfGJ=p9NiFR5KDK-i+dDZKF8R4g@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 29 Sep 2021 18:42:37 +0200
Message-ID: <CAHc6FU66vv4AjqFeCZ-k_21CGMyJpvxCLpQzexLJ2MBebyh6pg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix GL_SKIP node_scope problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 5:35 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Hi Bob,
>
> On Wed, Sep 29, 2021 at 3:21 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > Before this patch, when a glock was locked, the very first holder on the
> > queue would unlock the lockref and call the go_lock glops function (if
> > one existed), unless GL_SKIP was specified. When we introduced the new
> > node-scope concept, we allowed multiple holders to lock glocks in EX mode
> > and share the lock.
> >
> > But node-scope introduced a new problem: if the first holder has GL_SKIP
> > and the next one does NOT, since it is not the first holder on the queue,
> > the go_lock op was not called. Eventually the GL_SKIP holder may call the
> > go_lock sub-function (e.g. gfs2_rgrp_bh_get) but there was still a
> > window of time in which another non-GL_SKIP holder assumes the go_lock
> > function had been called by the first holder. In the case of rgrp glocks,
> > this led to a NULL pointer dereference on the buffer_heads.
> >
> > This patch tries to fix the problem by introducing two new glock flags:
> >
> > GLF_GO_LOCK_NEEDED, which keeps track of when the go_lock function needs
> > to be called to "fill in" or "read" the object before it is referenced.
> >
> > GLF_GO_LOCK_IN_PROG which is used to determine when a process is
> > in the process of reading in the object. Whenever a function needs to
> > reference the object, it checks the GLF_GO_LOCK_NEEDED flag, and if
> > set, it sets GLF_GO_LOCK_IN_PROG and calls the glops "go_lock" function.
> >
> > As before, the gl_lockref spin_lock is unlocked during the IO operation,
> > which may take a relatively long amount of time to complete. While
> > unlocked, if another process determines go_lock is still needed, it sees
> > the GLF_GO_LOCK_IN_PROG flag is set, and waits for the go_lock glop
> > operation to be completed. Once GLF_GO_LOCK_IN_PROG is cleared, it needs
> > to check GLF_GO_LOCK_NEEDED again because the other process's go_lock
> > operation may not have been successful.
> >
> > To faciliate this change, the go_lock section of function do_promote
> > was extracted to its own new function, gfs2_go_lock. The reason we do
> > this is because GL_SKIP callers often read in the object later.
> > Before this patch, those GL_SKIP callers (like gfs2_inode_lookup and
> > update_rgrp_lvb) called directly into the object-read functions
> > (gfs2_inode_refresh and gfs2_rgrp_bh_get respectively), but that never
> > cleared the new GLF_GO_LOCK_NEEDED flag. This patch changes those
> > functions so they call into the new gfs2_go_lock directly, which takes
> > care of all that.
>
> this is looking much better now. The naming of the go_lock callback
> and consequently the new flags is poor though; go_lock doesn't
> actually do any locking. Something like revalidate would make a lot
> more sense.
>
> > Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> > ---
> >  fs/gfs2/glock.c  | 136 +++++++++++++++++++++++++++++++++--------------
> >  fs/gfs2/glock.h  |   1 +
> >  fs/gfs2/glops.c  |  21 ++++----
> >  fs/gfs2/incore.h |   3 +-
> >  fs/gfs2/inode.c  |   4 +-
> >  fs/gfs2/rgrp.c   |  12 ++---
> >  fs/gfs2/super.c  |   6 ++-
> >  7 files changed, 121 insertions(+), 62 deletions(-)
> >
> > diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> > index 4fcf340603e7..750ea07b4173 100644
> > --- a/fs/gfs2/glock.c
> > +++ b/fs/gfs2/glock.c
> > @@ -380,6 +380,66 @@ static void do_error(struct gfs2_glock *gl, const int ret)
> >         }
> >  }
> >
> > +/**
> > + * gfs2_go_lock - Call the go_lock glops function
> > + * @gl: The glock
> > + *
> > + * Note: the GLF bits used throughout are protected by the lockref spinlock.
>
> They are? How?
>
> > + *
> > + * Returns: 0 if go_lock was successful, 2 if type specific operation is
> > + * underway, -EAGAIN if secondary go_lock was waiting for another caller of
> > + * go_lock, or error.
> > + */
> > +int gfs2_go_lock(struct gfs2_holder *gh)
> > +__releases(&gl->gl_lockref.lock)
> > +__acquires(&gl->gl_lockref.lock)
>
> These annotations seem wrong.
>
> > +{
> > +       struct gfs2_glock *gl = gh->gh_gl;
> > +       const struct gfs2_glock_operations *glops = gl->gl_ops;
> > +       int ret;
> > +
> > +       /*
> > +        * Since we unlock the lockref lock, we set a flag to indicate
> > +        * go_lock is in progress.
> > +        */
> > +       if (test_bit(GLF_GO_LOCK_IN_PROG, &gl->gl_flags)) {
> > +               wait_on_bit(&gl->gl_flags, GLF_GO_LOCK_IN_PROG,
> > +                           TASK_UNINTERRUPTIBLE);
> > +               /*
> > +                * Here we just waited for a st go_lock to finish.
> > +                * But that go_lock may not have been successful, as when
> > +                * a process locks an inode glock _before_ it has an actual
> > +                * inode to populate. So we check again. This secondary  waiter
> > +                * _might_ have an inode to populate.
> > +                */
> > +               return -EAGAIN;
>
> I'm not sure why the retrying needs to be handled by the caller. Also,
> there are callers now that don't handle -EAGAIN; what about those?
>
> > +       }
> > +
> > +       set_bit(GLF_GO_LOCK_IN_PROG, &gl->gl_flags);
> > +
> > +       /* FIXME: eliminate this eventually */
> > +       ret = glops->go_lock(gh);
> > +
> > +       switch(ret) {
> > +       case 0:
> > +               clear_bit(GLF_GO_LOCK_NEEDED, &gl->gl_flags);
> > +               break;
> > +       case 1:
> > +               ret = 2;
> > +               break;
> > +       default:
> > +               gh->gh_error = ret;
> > +               list_del_init(&gh->gh_list);
> > +               trace_gfs2_glock_queue(gh, 0);
> > +               gfs2_holder_wake(gh);
> > +               break;
> > +       }
> > +       clear_bit(GLF_GO_LOCK_IN_PROG, &gl->gl_flags);
> > +       smp_mb__after_atomic();
> > +       wake_up_bit(&gl->gl_flags, GLF_GO_LOCK_IN_PROG);
> > +       return ret;
> > +}
> > +
> >  /**
> >   * do_promote - promote as many requests as possible on the current queue
> >   * @gl: The glock
> > @@ -389,54 +449,50 @@ static void do_error(struct gfs2_glock *gl, const int ret)
> >   */
> >
> >  static int do_promote(struct gfs2_glock *gl)
> > -__releases(&gl->gl_lockref.lock)
> > -__acquires(&gl->gl_lockref.lock)
> >  {
> > -       const struct gfs2_glock_operations *glops = gl->gl_ops;
> >         struct gfs2_holder *gh, *tmp;
> >         int first;
> >
> > +       bool lock_released;
> >         int ret;
> >
> >  restart:
> >         list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
> > +               lock_released = false;
> >                 if (test_bit(HIF_HOLDER, &gh->gh_iflags))
> >                         continue;
> > -               if (may_grant(gl, gh)) {
> > -                       first = gfs2_first_holder(gh);
> > -                       if (first && glops->go_lock) {
> > -                               if (!(gh->gh_flags & GL_SKIP)) {
> > -                                       spin_unlock(&gl->gl_lockref.lock);
> > -                                       /* FIXME: eliminate this eventually */
> > -                                       ret = glops->go_lock(gh);
> > -                                       spin_lock(&gl->gl_lockref.lock);
> > -                                       if (ret) {
> > -                                               if (ret == 1)
> > -                                                       return 2;
> > -                                               gh->gh_error = ret;
> > -                                               list_del_init(&gh->gh_list);
> > -                                               trace_gfs2_glock_queue(gh, 0);
> > -                                               gfs2_holder_wake(gh);
> > -                                               goto restart;
> > -                                       }
> > -                               }
> > -                       }
> > -                       set_bit(HIF_HOLDER, &gh->gh_iflags);
> > -                       trace_gfs2_promote(gh, first);
> > -                       gfs2_holder_wake(gh);
> > -                       /*
> > -                        * If this was the first holder, we may have released
> > -                        * the gl_lockref.lock, so the holders list may have
> > -                        * changed. For that reason, we start again at the
> > -                        * start of the holders queue.
> > -                        */
> > -                       if (first)
> > -                               goto restart;
> > -                       continue;
> > +               if (!may_grant(gl, gh)) {
> > +                       if (gh->gh_list.prev == &gl->gl_holders)
> > +                               return 1;
> > +                       do_error(gl, 0);
> > +                       break;
> >                 }
> > -               if (gh->gh_list.prev == &gl->gl_holders)
> > -                       return 1;
> > -               do_error(gl, 0);
> > -               break;
> > +
> > +               first = gfs2_first_holder(gh);
> > +check_go_lock:
> > +               if (test_bit(GLF_GO_LOCK_NEEDED, &gl->gl_flags) &&
> > +                   !(gh->gh_flags & GL_SKIP)) {
> > +                       spin_unlock(&gl->gl_lockref.lock);
> > +                       ret = gfs2_go_lock(gh);
> > +                       spin_lock(&gl->gl_lockref.lock);
>
> I'm wondering if we can change go_lock to take a glock argument now.
> After that, we should be able to move the go_lock call to when we're
> done with the glock, when we've dropped the lockref spin lock already.
> Also, maybe we can move waiting for the flag to gfs2_glock_nq
> eventually.

Actually, I think this entire if can go into gfs2_glock_nq.

Andreas

> > +                       if (ret) {
> > +                               if (ret == -EAGAIN)
> > +                                       goto check_go_lock;
> > +                               else
> > +                                       goto restart;
> > +                       } else
> > +                               lock_released = true;
> > +               }
> > +
> > +               set_bit(HIF_HOLDER, &gh->gh_iflags);
> > +               trace_gfs2_promote(gh, first);
>
> I think 'first' can be killed now.
>
> > +               gfs2_holder_wake(gh);
> > +               /*
> > +                * If we released the gl_lockref.lock the holders list may have
> > +                * changed. For that reason, we start again at the start of
> > +                * the holders queue.
> > +                */
> > +               if (lock_released)
> > +                       goto restart;
> >         }
> >         return 0;
> >  }
> > @@ -1064,7 +1120,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
> >
> >         atomic_inc(&sdp->sd_glock_disposal);
> >         gl->gl_node.next = NULL;
> > -       gl->gl_flags = 0;
> > +       gl->gl_flags = glops->go_lock ? BIT(GLF_GO_LOCK_NEEDED) : 0;
> >         gl->gl_name = name;
> >         lockdep_set_subclass(&gl->gl_lockref.lock, glops->go_subclass);
> >         gl->gl_lockref.count = 1;
> > @@ -2153,6 +2209,8 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
> >                 *p++ = 'P';
> >         if (test_bit(GLF_FREEING, gflags))
> >                 *p++ = 'x';
> > +       if (test_bit(GLF_GO_LOCK_NEEDED, gflags))
> > +               *p++ = 'g';
> >         *p = 0;
> >         return buf;
> >  }
> > diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
> > index 8a09379dbf66..2e348e250fd2 100644
> > --- a/fs/gfs2/glock.h
> > +++ b/fs/gfs2/glock.h
> > @@ -195,6 +195,7 @@ extern void gfs2_holder_reinit(unsigned int state, u16 flags,
> >  extern void gfs2_holder_uninit(struct gfs2_holder *gh);
> >  extern int gfs2_glock_nq(struct gfs2_holder *gh);
> >  extern int gfs2_glock_poll(struct gfs2_holder *gh);
> > +extern int gfs2_go_lock(struct gfs2_holder *gh);
> >  extern int gfs2_glock_wait(struct gfs2_holder *gh);
> >  extern int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs);
> >  extern void gfs2_glock_dq(struct gfs2_holder *gh);
> > diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> > index 4b19f513570f..4823ba63c3bf 100644
> > --- a/fs/gfs2/glops.c
> > +++ b/fs/gfs2/glops.c
> > @@ -356,7 +356,7 @@ static void inode_go_inval(struct gfs2_glock *gl, int flags)
> >                 struct address_space *mapping = gfs2_glock2aspace(gl);
> >                 truncate_inode_pages(mapping, 0);
> >                 if (ip) {
> > -                       set_bit(GIF_INVALID, &ip->i_flags);
> > +                       set_bit(GLF_GO_LOCK_NEEDED, &gl->gl_flags);
> >                         forget_all_cached_acls(&ip->i_inode);
> >                         security_inode_invalidate_secctx(&ip->i_inode);
> >                         gfs2_dir_hash_inval(ip);
> > @@ -476,8 +476,6 @@ int gfs2_inode_refresh(struct gfs2_inode *ip)
> >
> >         error = gfs2_dinode_in(ip, dibh->b_data);
> >         brelse(dibh);
> > -       clear_bit(GIF_INVALID, &ip->i_flags);
>
> Yikes. Can replacing GIF_INVALID with GLF_GO_LOCK_NEEDED go in a separate patch?
>
> > -
> >         return error;
> >  }
> >
> > @@ -493,16 +491,14 @@ static int inode_go_lock(struct gfs2_holder *gh)
> >         struct gfs2_glock *gl = gh->gh_gl;
> >         struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
> >         struct gfs2_inode *ip = gl->gl_object;
> > -       int error = 0;
> > +       int error = 1;
> >
> > -       if (!ip)
> > -               return 0;
> > +       if (!ip) /* no inode to populate - read it in later */
> > +               goto out;
> >
> > -       if (test_bit(GIF_INVALID, &ip->i_flags)) {
> > -               error = gfs2_inode_refresh(ip);
> > -               if (error)
> > -                       return error;
> > -       }
> > +       error = gfs2_inode_refresh(ip);
> > +       if (error)
> > +               goto out;
> >
> >         if (gh->gh_state != LM_ST_DEFERRED)
> >                 inode_dio_wait(&ip->i_inode);
> > @@ -515,9 +511,10 @@ static int inode_go_lock(struct gfs2_holder *gh)
> >                         list_add(&ip->i_trunc_list, &sdp->sd_trunc_list);
> >                 spin_unlock(&sdp->sd_trunc_lock);
> >                 wake_up(&sdp->sd_quota_wait);
> > -               return 1;
> > +               error = 1;
> >         }
> >
> > +out:
> >         return error;
> >  }
> >
> > diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> > index 0fe49770166e..c98b37545f2c 100644
> > --- a/fs/gfs2/incore.h
> > +++ b/fs/gfs2/incore.h
> > @@ -315,6 +315,7 @@ struct gfs2_alloc_parms {
> >
> >  enum {
> >         GLF_LOCK                        = 1,
> > +       GLF_GO_LOCK_NEEDED              = 2, /* needs go_lock */
> >         GLF_DEMOTE                      = 3,
> >         GLF_PENDING_DEMOTE              = 4,
> >         GLF_DEMOTE_IN_PROGRESS          = 5,
> > @@ -324,6 +325,7 @@ enum {
> >         GLF_REPLY_PENDING               = 9,
> >         GLF_INITIAL                     = 10,
> >         GLF_FROZEN                      = 11,
> > +       GLF_GO_LOCK_IN_PROG             = 12, /* go_lock happening now */
> >         GLF_LRU                         = 13,
> >         GLF_OBJECT                      = 14, /* Used only for tracing */
> >         GLF_BLOCKING                    = 15,
> > @@ -370,7 +372,6 @@ struct gfs2_glock {
> >  };
> >
> >  enum {
> > -       GIF_INVALID             = 0,
> >         GIF_QD_LOCKED           = 1,
> >         GIF_ALLOC_FAILED        = 2,
> >         GIF_SW_PAGED            = 3,
> > diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> > index 6e15434b23ac..4e583e9a380c 100644
> > --- a/fs/gfs2/inode.c
> > +++ b/fs/gfs2/inode.c
> > @@ -182,7 +182,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
> >                 }
> >
> >                 glock_set_object(ip->i_gl, ip);
> > -               set_bit(GIF_INVALID, &ip->i_flags);
> > +               set_bit(GLF_GO_LOCK_NEEDED, &ip->i_gl->gl_flags);
> >                 error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
> >                 if (unlikely(error))
> >                         goto fail;
> > @@ -196,7 +196,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
> >
> >                 if (type == DT_UNKNOWN) {
> >                         /* Inode glock must be locked already */
> > -                       error = gfs2_inode_refresh(GFS2_I(inode));
> > +                       error = gfs2_go_lock(&i_gh);
> >                         if (error)
> >                                 goto fail;
> >                 } else {
> > diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> > index 96b2fbed6bf1..796f9e015218 100644
> > --- a/fs/gfs2/rgrp.c
> > +++ b/fs/gfs2/rgrp.c
> > @@ -1261,7 +1261,7 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
> >         return error;
> >  }
> >
> > -static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
> > +static int update_rgrp_lvb(struct gfs2_rgrpd *rgd, struct gfs2_holder *gh)
> >  {
> >         u32 rl_flags;
> >
> > @@ -1269,7 +1269,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
> >                 return 0;
> >
> >         if (cpu_to_be32(GFS2_MAGIC) != rgd->rd_rgl->rl_magic)
> > -               return gfs2_rgrp_bh_get(rgd);
> > +               gfs2_go_lock(gh);
> >
> >         rl_flags = be32_to_cpu(rgd->rd_rgl->rl_flags);
> >         rl_flags &= ~GFS2_RDF_MASK;
> > @@ -1312,6 +1312,7 @@ void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd)
> >                         bi->bi_bh = NULL;
> >                 }
> >         }
> > +       set_bit(GLF_GO_LOCK_NEEDED, &rgd->rd_gl->gl_flags);
> >  }
> >
> >  int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
> > @@ -2110,7 +2111,8 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
> >                             gfs2_rgrp_congested(rs->rs_rgd, loops))
> >                                 goto skip_rgrp;
> >                         if (sdp->sd_args.ar_rgrplvb) {
> > -                               error = update_rgrp_lvb(rs->rs_rgd);
> > +                               error = update_rgrp_lvb(rs->rs_rgd,
> > +                                                       &ip->i_rgd_gh);
> >                                 if (unlikely(error)) {
> >                                         rgrp_unlock_local(rs->rs_rgd);
> >                                         gfs2_glock_dq_uninit(&ip->i_rgd_gh);
> > @@ -2126,7 +2128,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
> >                         goto skip_rgrp;
> >
> >                 if (sdp->sd_args.ar_rgrplvb)
> > -                       gfs2_rgrp_bh_get(rs->rs_rgd);
> > +                       gfs2_go_lock(&ip->i_rgd_gh);
> >
> >                 /* Get a reservation if we don't already have one */
> >                 if (!gfs2_rs_active(rs))
> > @@ -2762,8 +2764,6 @@ void gfs2_rlist_free(struct gfs2_rgrp_list *rlist)
> >
> >  void rgrp_lock_local(struct gfs2_rgrpd *rgd)
> >  {
> > -       GLOCK_BUG_ON(rgd->rd_gl, !gfs2_glock_is_held_excl(rgd->rd_gl) &&
> > -                    !test_bit(SDF_NORECOVERY, &rgd->rd_sbd->sd_flags));
> >         mutex_lock(&rgd->rd_mutex);
> >  }
> >
> > diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> > index 6e00d15ef0a8..20698232774a 100644
> > --- a/fs/gfs2/super.c
> > +++ b/fs/gfs2/super.c
> > @@ -1244,8 +1244,10 @@ static enum dinode_demise evict_should_delete(struct inode *inode,
> >         if (ret)
> >                 return SHOULD_NOT_DELETE_DINODE;
> >
> > -       if (test_bit(GIF_INVALID, &ip->i_flags)) {
> > -               ret = gfs2_inode_refresh(ip);
> > +       if (test_bit(GLF_GO_LOCK_NEEDED, &ip->i_gl->gl_flags)) {
> > +               do {
> > +                       ret = gfs2_go_lock(gh);
> > +               } while (ret == -EAGAIN);
> >                 if (ret)
> >                         return SHOULD_NOT_DELETE_DINODE;
> >         }
> > --
> > 2.31.1
> >
>
> Thanks,
> Andreas

