Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A0A7724B7FD
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Aug 2020 13:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597921708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ows9SKK13y1eYz4WA5IIam6Aj7w/IVOwMjaqw2bUPoo=;
	b=G9mmTCm3goDDa1Gl8diGdX9dD/7q0g2Zj1rC34G9bgZi131Y6Tw1OQnSauAyFIfRKTbRfG
	tfH6JyQehKu1PVBcOtRsxQ7OaiiYQbyTv8IeXGnymUeXBB/RFJxLZtpynHHJkznA9wlkcP
	6QlbN5nDJZK1OeGDBYSlvZPsbm/6IuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-JnW9s_QkNAWu_woHlx_JaA-1; Thu, 20 Aug 2020 07:08:26 -0400
X-MC-Unique: JnW9s_QkNAWu_woHlx_JaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82816393B6;
	Thu, 20 Aug 2020 11:07:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5FF19C66;
	Thu, 20 Aug 2020 11:07:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFCC960345;
	Thu, 20 Aug 2020 11:07:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07KB7pwi011115 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Aug 2020 07:07:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 676F31111A47; Thu, 20 Aug 2020 11:07:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 636DD1111A45
	for <cluster-devel@redhat.com>; Thu, 20 Aug 2020 11:07:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59C948040D2
	for <cluster-devel@redhat.com>; Thu, 20 Aug 2020 11:07:48 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
	[209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-523-BGWSGhviPTqODVMA_C5SwQ-1; Thu, 20 Aug 2020 07:07:46 -0400
X-MC-Unique: BGWSGhviPTqODVMA_C5SwQ-1
Received: by mail-pj1-f71.google.com with SMTP id cp23so1022522pjb.9
	for <cluster-devel@redhat.com>; Thu, 20 Aug 2020 04:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ows9SKK13y1eYz4WA5IIam6Aj7w/IVOwMjaqw2bUPoo=;
	b=b5UyFsB7RrG8JMgL5gSz7mKYfO5DcNmdh/P2e8BfgXKNf4sLVA8BZbOX5fZ6Baazv8
	vxm6nhsu2abvqpWf5a/fz8jLc5GaONO9Ja4aLBw9RLzRjJLfbP4F+nPfOULxhumvzliz
	79ZR0Q9N5ySEpq2PxRe8z+trye0UD0tcCSPbgRsadDy5PdDP65Dz1KdCoTUhblDn8uVO
	o1GDkCrC4fL4sQ6crDbraa69npqwkaEbzph7pCmh5/8asK4hzWUY+8ubXOBb5l11dr8/
	ct+st2sTC38uvKWI6WJPGVHQYo8qBAN7Q15u5CAHLS1HZ3aV8omdIMtDYGNPerP4HKxj
	OY3g==
X-Gm-Message-State: AOAM533rOeN/iDoIX3DdUsBwGc7RcbWUAZ3vfCDOLT/SO7kIu5pI9nEq
	QA5nFUTgeE9yF8hQKXQZ2OOWoO++fB0bWyNIGQ3XFGqP8wjVqhlX2fy9MyAUataMuHK8pglKK0g
	geveQhbeJ1GV3fDxbVpv4GpO+YhoIJy1k4ygbkA==
X-Received: by 2002:a63:741b:: with SMTP id p27mr1995731pgc.194.1597921664880; 
	Thu, 20 Aug 2020 04:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy5JSp1HHv/djS/ASCCiPQioP8LsoLX69193w6RGTxfz2MP9AnNSk0gEbnX5epz6EzMlMX5pt8AZzDLayiLAE=
X-Received: by 2002:a63:741b:: with SMTP id p27mr1995712pgc.194.1597921664549; 
	Thu, 20 Aug 2020 04:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200813200114.5665-1-adas@redhat.com>
	<20200813200114.5665-4-adas@redhat.com>
	<1768511629.12781656.1597858067052.JavaMail.zimbra@redhat.com>
In-Reply-To: <1768511629.12781656.1597858067052.JavaMail.zimbra@redhat.com>
From: Abhijith Das <adas@redhat.com>
Date: Thu, 20 Aug 2020 06:07:33 -0500
Message-ID: <CACrDRjiSaQbKOSOkddh4etKeArDuMh-xjoaVa6PiGai6tDSyow@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 3/3] gfs2: Recover statfs info in
	journal head
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000031ebff05ad4d218c"

--00000000000031ebff05ad4d218c
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 19, 2020 at 12:27 PM Bob Peterson <rpeterso@redhat.com> wrote:

> ----- Original Message -----
> > Apply the outstanding statfs changes in the journal head to the
> > master statfs file. Zero out the local statfs file for good measure.
> >
> > Signed-off-by: Abhi Das <adas@redhat.com>
> > ---
> >  fs/gfs2/lops.c     |   2 +-
> >  fs/gfs2/lops.h     |   1 +
> >  fs/gfs2/recovery.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 123 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> > index 53d2dbf6605e..061747b959c8 100644
> > --- a/fs/gfs2/lops.c
> > +++ b/fs/gfs2/lops.c
> > @@ -831,7 +831,7 @@ static int buf_lo_scan_elements(struct gfs2_jdesc
> *jd,
> > u32 start,
> >   *
> >   */
> >
> > -static void gfs2_meta_sync(struct gfs2_glock *gl)
> > +void gfs2_meta_sync(struct gfs2_glock *gl)
> >  {
> >       struct address_space *mapping = gfs2_glock2aspace(gl);
> >       struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
> > diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
> > index 9c5e4e491e03..4a3d8aecdf82 100644
> > --- a/fs/gfs2/lops.h
> > +++ b/fs/gfs2/lops.h
> > @@ -27,6 +27,7 @@ extern void gfs2_log_submit_bio(struct bio **biop, int
> > opf);
> >  extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
> >  extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
> >                          struct gfs2_log_header_host *head, bool
> keep_cache);
> > +extern void gfs2_meta_sync(struct gfs2_glock *gl);
> >
> >  static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
> >  {
> > diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> > index a8bb17e355b8..428a0aad49c6 100644
> > --- a/fs/gfs2/recovery.c
> > +++ b/fs/gfs2/recovery.c
> > @@ -296,6 +296,126 @@ static void gfs2_recovery_done(struct gfs2_sbd
> *sdp,
> > unsigned int jid,
> >               sdp->sd_lockstruct.ls_ops->lm_recovery_result(sdp, jid,
> message);
> >  }
> >
> > +static int lookup_statfs_inodes(struct gfs2_jdesc *jd, struct inode
> > **master,
> > +                             struct inode **local)
> > +{
> > +     int error = 0;
> > +     char buf[30];
> > +     struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
> > +     struct inode *md = d_inode(sdp->sd_master_dir), *pn;
> > +
> > +     *master = gfs2_lookup_simple(md, "statfs");
> > +     if (IS_ERR(*master)) {
> > +             error = PTR_ERR(*master);
> > +             fs_err(sdp, "Can't read in statfs inode: %d\n", error);
> > +             goto out;
> > +     }
> > +     pn = gfs2_lookup_simple(md, "per_node");
> > +     if (IS_ERR(pn)) {
> > +             error = PTR_ERR(pn);
> > +             fs_err(sdp, "Can't find per_node directory: %d\n", error);
> > +             goto put_m_ip;
> > +     }
> > +     sprintf(buf, "statfs_change%u", jd->jd_jid);
> > +     *local = gfs2_lookup_simple(pn, buf);
> > +     if (IS_ERR(*local)) {
> > +             error = PTR_ERR(*local);
> > +             fs_err(sdp, "Can't find local \"sc\" file for jid:%u:
> %d\n",
> > +                    jd->jd_jid, error);
> > +     }
> > +     iput(pn);
> > +     if (!error)
> > +             return error;
> > +put_m_ip:
> > +     iput(*master);
> > +out:
> > +     return error;
> > +}
> > +
> > +static int update_statfs_inode(struct gfs2_jdesc *jd, struct gfs2_inode
> *ip,
> > +                            struct gfs2_log_header_host *head)
> > +{
> > +     /*
> > +      * If head is NULL, ip points to a local statfs file.
> > +      * zero out the statfs data in the inode pointed to by ip.
> > +      */
> > +     struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
> > +     struct gfs2_statfs_change_host sc;
> > +     struct gfs2_holder gh;
> > +     struct buffer_head *bh;
> > +     int error = 0;
> > +
> > +     error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_NOCACHE,
> &gh);
> > +     if (error)
> > +             goto out;
> > +
> > +     error = gfs2_meta_inode_buffer(ip, &bh);
> > +     if (error)
> > +             goto out_unlock;
> > +
> > +     spin_lock(&sdp->sd_statfs_spin);
> > +     if (head) {
> > +             gfs2_statfs_change_in(&sc, bh->b_data + sizeof(struct
> gfs2_dinode));
> > +             sc.sc_total += head->lh_local_total;
> > +             sc.sc_free += head->lh_local_free;
> > +             sc.sc_dinodes += head->lh_local_dinodes;
> > +             gfs2_statfs_change_out(&sc, bh->b_data + sizeof(struct
> gfs2_dinode));
> > +             fs_info(sdp, "jid=%u: Updated master statfs Total:%lld, "
> > +                     "Free:%lld, Dinodes:%lld after change "
> > +                     "[%+lld,%+lld,%+lld]\n", jd->jd_jid, sc.sc_total,
> > +                     sc.sc_free, sc.sc_dinodes, head->lh_local_total,
> > +                     head->lh_local_free, head->lh_local_dinodes);
> > +     } else {
> > +             memset(bh->b_data + sizeof(struct gfs2_dinode), 0,
> > +                    sizeof(struct gfs2_statfs_change));
> > +             if (jd->jd_jid == sdp->sd_lockstruct.ls_jid) { /* This
> node's journal */
> > +                     sdp->sd_statfs_local.sc_total = 0;
> > +                     sdp->sd_statfs_local.sc_free = 0;
> > +                     sdp->sd_statfs_local.sc_dinodes = 0;
> > +             }
> > +     }
> > +     spin_unlock(&sdp->sd_statfs_spin);
> > +     mark_buffer_dirty(bh);
> > +     brelse(bh);
> > +     gfs2_meta_sync(ip->i_gl);
> > +
> > +out_unlock:
> > +     gfs2_glock_dq_uninit(&gh);
> > +out:
> > +     return error;
> > +}
> > +
> > +static void recover_local_statfs(struct gfs2_jdesc *jd,
> > +                              struct gfs2_log_header_host *head)
> > +{
> > +     struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
> > +     struct inode *master = NULL, *local = NULL;
> > +     int error;
> > +
> > +     if (!head->lh_local_total && !head->lh_local_free
> > +         && !head->lh_local_dinodes) /* No change */
> > +             goto out;
> > +
> > +     error = lookup_statfs_inodes(jd, &master, &local);
> > +     if (error)
> > +             goto out;
> > +     error = update_statfs_inode(jd, GFS2_I(master), head);
> > +     if (error)
> > +             goto iput_inodes;
> > +     error = update_statfs_inode(jd, GFS2_I(local), NULL);
> > +     if (error)
> > +             goto iput_inodes;
> > +     if (jd->jd_jid == sdp->sd_lockstruct.ls_jid)
> > +             memset(&sdp->sd_statfs_local, 0,
> > +                    sizeof(struct gfs2_statfs_change_host));
> > +
> > +iput_inodes:
> > +     iput(master);
> > +     iput(local);
> > +out:
> > +     return;
> > +}
> > +
> >  void gfs2_recover_func(struct work_struct *work)
> >  {
> >       struct gfs2_jdesc *jd = container_of(work, struct gfs2_jdesc,
> jd_work);
> > @@ -415,6 +535,7 @@ void gfs2_recover_func(struct work_struct *work)
> >                               goto fail_gunlock_thaw;
> >               }
> >
> > +             recover_local_statfs(jd, &head);
> >               clean_journal(jd, &head);
> >               up_read(&sdp->sd_log_flush_lock);
> >
> > --
> > 2.20.1
> >
> >
> Hi,
>
> Why do we need to look up all these inodes?
>
> Function init_inodes() looks up sd_statfs_inode and init_per_node() looks
> up
> the statfs_changeX file, both of which are called pretty early during
> mount.
>
> It seems to me sdp->sd_statfs_inode should already contain the master
> statfs
> inode and sdp->sd_sc_inode should contain the current statfs_changeX inode
> until unmount.
>
> Of course, since the recover workqueue is initialized earlier, I'm guessing
> maybe dlm can call gfs2 to do recovery before this initialization is done?
> Maybe we can move the lookups prior to this or the workqueue after it?
>
> It just seems like we can somehow avoid these lookups because they're done
> elsewhere. But I haven't traced the code paths and you have, so maybe I'm
> off base here.
>
> Regards,
>
> Bob Peterson
>
>
If we're recovering for another node, we need to lookup its local statfs
inode. IIRC from my testing, the statfs inodes weren't initialized at the
point where we use them here, but I'll double-check. Regardless, there's a
bit of optimization that can be done here. I'll post a revised version.

Cheers!
--Abhi

--00000000000031ebff05ad4d218c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace"><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 19, 2020 at 12:27 PM Bo=
b Peterson &lt;<a href=3D"mailto:rpeterso@redhat.com">rpeterso@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">--=
--- Original Message -----<br>
&gt; Apply the outstanding statfs changes in the journal head to the<br>
&gt; master statfs file. Zero out the local statfs file for good measure.<b=
r>
&gt; <br>
&gt; Signed-off-by: Abhi Das &lt;<a href=3D"mailto:adas@redhat.com" target=
=3D"_blank">adas@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 fs/gfs2/lops.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 fs/gfs2/lops.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 fs/gfs2/recovery.c | 121 +++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 3 files changed, 123 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c<br>
&gt; index 53d2dbf6605e..061747b959c8 100644<br>
&gt; --- a/fs/gfs2/lops.c<br>
&gt; +++ b/fs/gfs2/lops.c<br>
&gt; @@ -831,7 +831,7 @@ static int buf_lo_scan_elements(struct gfs2_jdesc =
*jd,<br>
&gt; u32 start,<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt; -static void gfs2_meta_sync(struct gfs2_glock *gl)<br>
&gt; +void gfs2_meta_sync(struct gfs2_glock *gl)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct address_space *mapping =3D gfs2_glock=
2aspace(gl);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gfs2_sbd *sdp =3D gl-&gt;gl_name.ln_s=
bd;<br>
&gt; diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h<br>
&gt; index 9c5e4e491e03..4a3d8aecdf82 100644<br>
&gt; --- a/fs/gfs2/lops.h<br>
&gt; +++ b/fs/gfs2/lops.h<br>
&gt; @@ -27,6 +27,7 @@ extern void gfs2_log_submit_bio(struct bio **biop, i=
nt<br>
&gt; opf);<br>
&gt;=C2=A0 extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *b=
h);<br>
&gt;=C2=A0 extern int gfs2_find_jhead(struct gfs2_jdesc *jd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 struct gfs2_log_header_host *head, bool keep_cache);<b=
r>
&gt; +extern void gfs2_meta_sync(struct gfs2_glock *gl);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static inline unsigned int buf_limit(struct gfs2_sbd *sdp)<br>
&gt;=C2=A0 {<br>
&gt; diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c<br>
&gt; index a8bb17e355b8..428a0aad49c6 100644<br>
&gt; --- a/fs/gfs2/recovery.c<br>
&gt; +++ b/fs/gfs2/recovery.c<br>
&gt; @@ -296,6 +296,126 @@ static void gfs2_recovery_done(struct gfs2_sbd *=
sdp,<br>
&gt; unsigned int jid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdp-&gt;sd_locks=
truct.ls_ops-&gt;lm_recovery_result(sdp, jid, message);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static int lookup_statfs_inodes(struct gfs2_jdesc *jd, struct inode<b=
r>
&gt; **master,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct inode **local)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char buf[30];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gfs2_sbd *sdp =3D GFS2_SB(jd-&gt;jd_inode)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct inode *md =3D d_inode(sdp-&gt;sd_master_di=
r), *pn;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*master =3D gfs2_lookup_simple(md, &quot;statfs&q=
uot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(*master)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D PTR_ERR(*ma=
ster);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fs_err(sdp, &quot;Can=
&#39;t read in statfs inode: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pn =3D gfs2_lookup_simple(md, &quot;per_node&quot=
;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(pn)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D PTR_ERR(pn)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fs_err(sdp, &quot;Can=
&#39;t find per_node directory: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto put_m_ip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprintf(buf, &quot;statfs_change%u&quot;, jd-&gt;=
jd_jid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*local =3D gfs2_lookup_simple(pn, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(*local)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D PTR_ERR(*lo=
cal);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fs_err(sdp, &quot;Can=
&#39;t find local \&quot;sc\&quot; file for jid:%u: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 jd-&gt;jd_jid, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iput(pn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +put_m_ip:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iput(*master);<br>
&gt; +out:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int update_statfs_inode(struct gfs2_jdesc *jd, struct gfs2_ino=
de *ip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gfs2_log_header_host *head)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If head is NULL, ip points to a local statfs f=
ile.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * zero out the statfs data in the inode pointed =
to by ip.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gfs2_sbd *sdp =3D GFS2_SB(jd-&gt;jd_inode)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gfs2_statfs_change_host sc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gfs2_holder gh;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct buffer_head *bh;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D gfs2_glock_nq_init(ip-&gt;i_gl, LM_ST_E=
XCLUSIVE, GL_NOCACHE, &amp;gh);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D gfs2_meta_inode_buffer(ip, &amp;bh);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;sdp-&gt;sd_statfs_spin);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (head) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gfs2_statfs_change_in=
(&amp;sc, bh-&gt;b_data + sizeof(struct gfs2_dinode));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc.sc_total +=3D head=
-&gt;lh_local_total;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc.sc_free +=3D head-=
&gt;lh_local_free;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc.sc_dinodes +=3D he=
ad-&gt;lh_local_dinodes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gfs2_statfs_change_ou=
t(&amp;sc, bh-&gt;b_data + sizeof(struct gfs2_dinode));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fs_info(sdp, &quot;ji=
d=3D%u: Updated master statfs Total:%lld, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Free:%lld, Dinodes:%lld after change &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;[%+lld,%+lld,%+lld]\n&quot;, jd-&gt;jd_jid, sc.sc_total,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sc.sc_free, sc.sc_dinodes, head-&gt;lh_local_total,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0head-&gt;lh_local_free, head-&gt;lh_local_dinodes);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(bh-&gt;b_data =
+ sizeof(struct gfs2_dinode), 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 sizeof(struct gfs2_statfs_change));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (jd-&gt;jd_jid =3D=
=3D sdp-&gt;sd_lockstruct.ls_jid) { /* This node&#39;s journal */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sdp-&gt;sd_statfs_local.sc_total =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sdp-&gt;sd_statfs_local.sc_free =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sdp-&gt;sd_statfs_local.sc_dinodes =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;sdp-&gt;sd_statfs_spin);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mark_buffer_dirty(bh);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0brelse(bh);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gfs2_meta_sync(ip-&gt;i_gl);<br>
&gt; +<br>
&gt; +out_unlock:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gfs2_glock_dq_uninit(&amp;gh);<br>
&gt; +out:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void recover_local_statfs(struct gfs2_jdesc *jd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gfs2_log_header_host *head)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gfs2_sbd *sdp =3D GFS2_SB(jd-&gt;jd_inode)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct inode *master =3D NULL, *local =3D NULL;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!head-&gt;lh_local_total &amp;&amp; !head-&gt=
;lh_local_free<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !head-&gt;lh_local_dinod=
es) /* No change */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D lookup_statfs_inodes(jd, &amp;master, &=
amp;local);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D update_statfs_inode(jd, GFS2_I(master),=
 head);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto iput_inodes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D update_statfs_inode(jd, GFS2_I(local), =
NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto iput_inodes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (jd-&gt;jd_jid =3D=3D sdp-&gt;sd_lockstruct.ls=
_jid)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;sdp-&gt;s=
d_statfs_local, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 sizeof(struct gfs2_statfs_change_host));<br>
&gt; +<br>
&gt; +iput_inodes:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iput(master);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iput(local);<br>
&gt; +out:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 void gfs2_recover_func(struct work_struct *work)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gfs2_jdesc *jd =3D container_of(work,=
 struct gfs2_jdesc, jd_work);<br>
&gt; @@ -415,6 +535,7 @@ void gfs2_recover_func(struct work_struct *work)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_gunlock_thaw;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recover_local_statfs(=
jd, &amp;head);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clean_journal(jd=
, &amp;head);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0up_read(&amp;sdp=
-&gt;sd_log_flush_lock);<br>
&gt;=C2=A0 <br>
&gt; --<br>
&gt; 2.20.1<br>
&gt; <br>
&gt; <br>
Hi,<br>
<br>
Why do we need to look up all these inodes?<br>
<br>
Function init_inodes() looks up sd_statfs_inode and init_per_node() looks u=
p<br>
the statfs_changeX file, both of which are called pretty early during mount=
.<br>
<br>
It seems to me sdp-&gt;sd_statfs_inode should already contain the master st=
atfs<br>
inode and sdp-&gt;sd_sc_inode should contain the current statfs_changeX ino=
de<br>
until unmount.<br>
<br>
Of course, since the recover workqueue is initialized earlier, I&#39;m gues=
sing<br>
maybe dlm can call gfs2 to do recovery before this initialization is done?<=
br>
Maybe we can move the lookups prior to this or the workqueue after it?<br>
<br>
It just seems like we can somehow avoid these lookups because they&#39;re d=
one<br>
elsewhere. But I haven&#39;t traced the code paths and you have, so maybe I=
&#39;m<br>
off base here.<br>
<br>
Regards,<br>
<br>
Bob Peterson<br>
<br></blockquote><div><span class=3D"gmail_default" style=3D"font-family:mo=
nospace,monospace"><br></span></div><div><span class=3D"gmail_default" styl=
e=3D"font-family:monospace,monospace">If we&#39;re recovering for another n=
ode, we need to lookup its local statfs inode. IIRC from my testing, the st=
atfs inodes weren&#39;t initialized at the point where we use them here, bu=
t I&#39;ll double-check. Regardless, there&#39;s a bit of optimization that=
 can be done here. I&#39;ll post a revised version.</span></div><div><span =
class=3D"gmail_default" style=3D"font-family:monospace,monospace"><br></spa=
n></div><div><span class=3D"gmail_default" style=3D"font-family:monospace,m=
onospace">Cheers!</span></div><div><span class=3D"gmail_default" style=3D"f=
ont-family:monospace,monospace">--Abhi</span></div></div></div>

--00000000000031ebff05ad4d218c--

