Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4853C24B7C5
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Aug 2020 13:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597921475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=M3ZmHNOyqKErYUbMG+kzslIjbQp+YC1HB1RNBgYVSFM=;
	b=gifniA2KtQUgaiDMA9KW9MjxTGwg8HqvjFGM8rNuQWaGF5OEXPsZz+8+5ys0uM0ENVPZuV
	tN2mHZEP0uxs9ypLi078mfHtJBIxO7N84zDnURKsuEqRQvZ1PrXwWOTAnAzKw5ALOS0IVW
	zR5k7uIwbRaAReMa70gVU5/j803Pg9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-I7KmdwFCNxO_4jRaIrZ2dw-1; Thu, 20 Aug 2020 07:04:32 -0400
X-MC-Unique: I7KmdwFCNxO_4jRaIrZ2dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C01875703E;
	Thu, 20 Aug 2020 11:04:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCAB919C66;
	Thu, 20 Aug 2020 11:04:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54B8260346;
	Thu, 20 Aug 2020 11:04:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07KB4Hx1010941 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Aug 2020 07:04:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3645E202279A; Thu, 20 Aug 2020 11:04:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 314012028DCC
	for <cluster-devel@redhat.com>; Thu, 20 Aug 2020 11:04:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17EA0101A540
	for <cluster-devel@redhat.com>; Thu, 20 Aug 2020 11:04:15 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
	[209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-180-6CPPawpCNuOKdoCkRWT2HA-1; Thu, 20 Aug 2020 07:04:12 -0400
X-MC-Unique: 6CPPawpCNuOKdoCkRWT2HA-1
Received: by mail-pl1-f200.google.com with SMTP id w23so1335816pll.21
	for <cluster-devel@redhat.com>; Thu, 20 Aug 2020 04:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M3ZmHNOyqKErYUbMG+kzslIjbQp+YC1HB1RNBgYVSFM=;
	b=HvOOyG9Ie5extUPNRI/euvCA9Wm/qqZssuxEBUu0Lu73/ZEdpUQWBdSVPnRehDGHGf
	NZ629iq36+R/Oi5dmsSQt1zq3OgfRMqI5+2F0P2ZKTcHKZZTFnE/ssvxew6AmdSVOu0N
	+3nsr6K6DtEtu41C6yxclrtYY7nhLmJAftgu2MelpKHJQNIbBL/gte28thAojL1pTBzC
	ImYkpA16vCJLK8YFyfd+kdjXwHRemaUNRLWVCmNrqGRmFEPnYuqJBHqF8qlDlBSfDnuX
	3tWRGfRevYf2rdy5yk1vvSHx5uKvOpuBZSMGTb2NssAT1Y2J/Ff2EJoDyGf9nICop7BK
	lQlg==
X-Gm-Message-State: AOAM531vb3sqajYEcw4GYAeW+/lxohJpx218Pjjwww3u8Vr15RUvPXVK
	j43h/BEY/Ngl93DN90cqoxk/WL4qD+OQHy/7F1JFsptMYXYJB7sBmSfIvb+42eOovHa+WgNIHze
	kcPsPX8GlapyDY/q4vh+gTNtQDN2u8AN4/0y1sg==
X-Received: by 2002:a17:90b:193:: with SMTP id
	t19mr2151214pjs.162.1597921451634; 
	Thu, 20 Aug 2020 04:04:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3vD3zttuewiHvi6PaG1os47m3vQqCWIlVJwRFtCRCD6NGUog5oqeSiKXc2z6tx3z+BtvQ00OxBGEebTUbGm4=
X-Received: by 2002:a17:90b:193:: with SMTP id
	t19mr2151196pjs.162.1597921451372; 
	Thu, 20 Aug 2020 04:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200813200114.5665-1-adas@redhat.com>
	<20200813200114.5665-2-adas@redhat.com>
	<165825613.12780098.1597856846775.JavaMail.zimbra@redhat.com>
In-Reply-To: <165825613.12780098.1597856846775.JavaMail.zimbra@redhat.com>
From: Abhijith Das <adas@redhat.com>
Date: Thu, 20 Aug 2020 06:04:00 -0500
Message-ID: <CACrDRjiVxrtX_tLmO+Ym=gbCrsndvOYp42z34ESbWNsiB5XP6w@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 1/3] gfs2: Don't write updates to local
 statfs file
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
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007d0f2705ad4d1403"

--0000000000007d0f2705ad4d1403
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 19, 2020 at 12:07 PM Bob Peterson <rpeterso@redhat.com> wrote:

> ----- Original Message -----
> > We store the local statfs info in the journal header now so
> > there's no need to write to the local statfs file anymore.
> >
> > Signed-off-by: Abhi Das <adas@redhat.com>
> > ---
> >  fs/gfs2/lops.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> > index cb2a11b458c6..53d2dbf6605e 100644
> > --- a/fs/gfs2/lops.c
> > +++ b/fs/gfs2/lops.c
> > @@ -104,7 +104,15 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, struct
> > buffer_head *bh,
> >       BUG_ON(!buffer_pinned(bh));
> >
> >       lock_buffer(bh);
> > -     mark_buffer_dirty(bh);
> > +     /*
> > +      * We want to eliminate the local statfs file eventually.
> > +      * But, for now, we're simply not going to update it by
> > +      * never marking its buffers dirty
> > +      */
> > +     if (!(bd->bd_gl->gl_name.ln_type == LM_TYPE_INODE &&
> > +           bd->bd_gl->gl_object == GFS2_I(sdp->sd_sc_inode)))
> > +             mark_buffer_dirty(bh);
> > +
> >       clear_buffer_pinned(bh);
> >
> >       if (buffer_is_rgrp(bd))
> > --
> > 2.20.1
>
> Hi,
>
> This seems dangerous to me. It can only get to gfs2_unpin by trying to
> commit buffers for a transaction. If the buffers aren't marked dirty,
> that means transactions will be queued to the ail1 list that won't be
> fully written. So what happens to them? Do they eventually get freed?
>
> I'm also concerned about a potential impact to performance, since
> gfs2_unpin gets called with every metadata buffer that's used.
> The additional if checks may not costs us much time-wise, but it's a
> pretty hot function.
>
> Can't we accomplish the same thing by making function update_statfs()
> never add the buffers to the transaction in the first place?
> IOW, by just removing the line:
>         gfs2_trans_add_meta(m_ip->i_gl, m_bh);
> That way we don't need to worry about its buffer getting pinned,
> unpinned and queued to the ail.
>
> Regards,
>
> Bob Peterson
>
>
Fair point. I'll post an updated version of this patch that  doesn't queue
the buffer in the first place.

Cheers!
--Abhi

--0000000000007d0f2705ad4d1403
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace"><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 19, 2020 at 12:07 PM Bo=
b Peterson &lt;<a href=3D"mailto:rpeterso@redhat.com">rpeterso@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">--=
--- Original Message -----<br>
&gt; We store the local statfs info in the journal header now so<br>
&gt; there&#39;s no need to write to the local statfs file anymore.<br>
&gt; <br>
&gt; Signed-off-by: Abhi Das &lt;<a href=3D"mailto:adas@redhat.com" target=
=3D"_blank">adas@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 fs/gfs2/lops.c | 10 +++++++++-<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c<br>
&gt; index cb2a11b458c6..53d2dbf6605e 100644<br>
&gt; --- a/fs/gfs2/lops.c<br>
&gt; +++ b/fs/gfs2/lops.c<br>
&gt; @@ -104,7 +104,15 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, stru=
ct<br>
&gt; buffer_head *bh,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BUG_ON(!buffer_pinned(bh));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lock_buffer(bh);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mark_buffer_dirty(bh);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * We want to eliminate the local statfs file eve=
ntually.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * But, for now, we&#39;re simply not going to up=
date it by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * never marking its buffers dirty<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!(bd-&gt;bd_gl-&gt;gl_name.ln_type =3D=3D LM_=
TYPE_INODE &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bd-&gt;bd_gl-&gt;gl_object =
=3D=3D GFS2_I(sdp-&gt;sd_sc_inode)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mark_buffer_dirty(bh)=
;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clear_buffer_pinned(bh);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer_is_rgrp(bd))<br>
&gt; --<br>
&gt; 2.20.1<br>
<br>
Hi,<br>
<br>
This seems dangerous to me. It can only get to gfs2_unpin by trying to<br>
commit buffers for a transaction. If the buffers aren&#39;t marked dirty,<b=
r>
that means transactions will be queued to the ail1 list that won&#39;t be<b=
r>
fully written. So what happens to them? Do they eventually get freed?<br>
<br>
I&#39;m also concerned about a potential impact to performance, since<br>
gfs2_unpin gets called with every metadata buffer that&#39;s used.<br>
The additional if checks may not costs us much time-wise, but it&#39;s a<br=
>
pretty hot function.<br>
<br>
Can&#39;t we accomplish the same thing by making function update_statfs()<b=
r>
never add the buffers to the transaction in the first place?<br>
IOW, by just removing the line:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfs2_trans_add_meta(m_ip-&gt;i_gl, m_bh);<br>
That way we don&#39;t need to worry about its buffer getting pinned,<br>
unpinned and queued to the ail.<br>
<br>
Regards,<br>
<br>
Bob Peterson<br>
<br></blockquote><div>=C2=A0</div><div><span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">Fair point. I&#39;ll post an updated v=
ersion of this patch that </span>=C2=A0<span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">doesn&#39;t queue the buffer in the fi=
rst place.</span></div><div><span class=3D"gmail_default" style=3D"font-fam=
ily:monospace,monospace"><br></span></div><div><span class=3D"gmail_default=
" style=3D"font-family:monospace,monospace">Cheers!<br>--Abhi</span></div><=
/div></div>

--0000000000007d0f2705ad4d1403--

