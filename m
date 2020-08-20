Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9986824B8AE
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Aug 2020 13:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597922795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QVtT/a7JubrUut56LglmhcKwSC5ah39tErbJ5ahMsYM=;
	b=J1jo1POs2BddROfc6dsRmX0WU2+BWHWen2JPyXw8RCCzMUFEw9z7iBlN3jurO9B4zcSHZr
	mLml+F96ushl7q9E8o9ADx2LNK0kf4Uq7JvkaQcO6evC4BH8/kDqeW44Yvg7g6rXUTX3vF
	/lCcZblTzWpw2VR91Mr7QOYnRYSoneY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-4zkFqIkoNgm0uB-sTu1yEw-1; Thu, 20 Aug 2020 07:26:33 -0400
X-MC-Unique: 4zkFqIkoNgm0uB-sTu1yEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F36FB14996;
	Thu, 20 Aug 2020 11:26:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E0D860CD0;
	Thu, 20 Aug 2020 11:26:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D55ED183D020;
	Thu, 20 Aug 2020 11:26:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07KBNqMf012433 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Aug 2020 07:23:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 41B6416E27; Thu, 20 Aug 2020 11:23:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15D0616E2C;
	Thu, 20 Aug 2020 11:23:47 +0000 (UTC)
To: Abhijith Das <adas@redhat.com>, Bob Peterson <rpeterso@redhat.com>
References: <20200813200114.5665-1-adas@redhat.com>
	<20200813200114.5665-2-adas@redhat.com>
	<165825613.12780098.1597856846775.JavaMail.zimbra@redhat.com>
	<CACrDRjiVxrtX_tLmO+Ym=gbCrsndvOYp42z34ESbWNsiB5XP6w@mail.gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <2d73dff8-af76-4fc8-fee8-306bc17aeb9a@redhat.com>
Date: Thu, 20 Aug 2020 12:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CACrDRjiVxrtX_tLmO+Ym=gbCrsndvOYp42z34ESbWNsiB5XP6w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
	boundary="------------6A82FC8291390462CE31D946"

This is a multi-part message in MIME format.
--------------6A82FC8291390462CE31D946
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 20/08/2020 12:04, Abhijith Das wrote:
>
>
> On Wed, Aug 19, 2020 at 12:07 PM Bob Peterson <rpeterso@redhat.com=20
> <mailto:rpeterso@redhat.com>> wrote:
>
>     ----- Original Message -----
>     > We store the local statfs info in the journal header now so
>     > there's no need to write to the local statfs file anymore.
>     >
>     > Signed-off-by: Abhi Das <adas@redhat.com <mailto:adas@redhat.com>>
>     > ---
>     >=C2=A0 fs/gfs2/lops.c | 10 +++++++++-
>     >=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
>     > index cb2a11b458c6..53d2dbf6605e 100644
>     > --- a/fs/gfs2/lops.c
>     > +++ b/fs/gfs2/lops.c
>     > @@ -104,7 +104,15 @@ static void gfs2_unpin(struct gfs2_sbd
>     *sdp, struct
>     > buffer_head *bh,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0BUG_ON(!buffer_pinned(bh));
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0lock_buffer(bh);
>     > -=C2=A0 =C2=A0 =C2=A0mark_buffer_dirty(bh);
>     > +=C2=A0 =C2=A0 =C2=A0/*
>     > +=C2=A0 =C2=A0 =C2=A0 * We want to eliminate the local statfs file =
eventually.
>     > +=C2=A0 =C2=A0 =C2=A0 * But, for now, we're simply not going to upd=
ate it by
>     > +=C2=A0 =C2=A0 =C2=A0 * never marking its buffers dirty
>     > +=C2=A0 =C2=A0 =C2=A0 */
>     > +=C2=A0 =C2=A0 =C2=A0if (!(bd->bd_gl->gl_name.ln_type =3D=3D LM_TYP=
E_INODE &&
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bd->bd_gl->gl_object =3D=
=3D GFS2_I(sdp->sd_sc_inode)))
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mark_buffer_dirty(=
bh);
>     > +
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0clear_buffer_pinned(bh);
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer_is_rgrp(bd))
>     > --
>     > 2.20.1
>
>     Hi,
>
>     This seems dangerous to me. It can only get to gfs2_unpin by trying t=
o
>     commit buffers for a transaction. If the buffers aren't marked dirty,
>     that means transactions will be queued to the ail1 list that won't be
>     fully written. So what happens to them? Do they eventually get freed?
>
>     I'm also concerned about a potential impact to performance, since
>     gfs2_unpin gets called with every metadata buffer that's used.
>     The additional if checks may not costs us much time-wise, but it's a
>     pretty hot function.
>
>     Can't we accomplish the same thing by making function update_statfs()
>     never add the buffers to the transaction in the first place?
>     IOW, by just removing the line:
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 gfs2_trans_add_meta(m_ip->i_gl, m_bh);
>     That way we don't need to worry about its buffer getting pinned,
>     unpinned and queued to the ail.
>
>     Regards,
>
>     Bob Peterson
>
> Fair point. I'll post an updated version of this patch that doesn't=20
> queue the buffer in the first place.
>
> Cheers!
> --Abhi

You need to think about correctness at recovery time. It may be faster=20
to not write the data into the journal for the local statfs file, but=20
how will that affect recovery depending on whether that recovery is=20
performed by either a newer or older kernel? Being backwards compatible=20
might be more important in this case, so worth looking at carefully,

Steve.



--------------6A82FC8291390462CE31D946
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 20/08/2020 12:04, Abhijith Das
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CACrDRjiVxrtX_tLmO+Ym=3DgbCrsndvOYp42z34ESbWNsiB5XP6w@mail.gmai=
l.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace"><br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 19, 2020 at
            12:07 PM Bob Peterson &lt;<a
              href=3D"mailto:rpeterso@redhat.com" moz-do-not-send=3D"true">=
rpeterso@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">----- Original Message
            -----<br>
            &gt; We store the local statfs info in the journal header
            now so<br>
            &gt; there's no need to write to the local statfs file
            anymore.<br>
            &gt; <br>
            &gt; Signed-off-by: Abhi Das &lt;<a
              href=3D"mailto:adas@redhat.com" target=3D"_blank"
              moz-do-not-send=3D"true">adas@redhat.com</a>&gt;<br>
            &gt; ---<br>
            &gt;=C2=A0 fs/gfs2/lops.c | 10 +++++++++-<br>
            &gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
            &gt; <br>
            &gt; diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c<br>
            &gt; index cb2a11b458c6..53d2dbf6605e 100644<br>
            &gt; --- a/fs/gfs2/lops.c<br>
            &gt; +++ b/fs/gfs2/lops.c<br>
            &gt; @@ -104,7 +104,15 @@ static void gfs2_unpin(struct
            gfs2_sbd *sdp, struct<br>
            &gt; buffer_head *bh,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BUG_ON(!buffer_pinned(bh));<br>
            &gt;=C2=A0 <br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lock_buffer(bh);<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0mark_buffer_dirty(bh);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 * We want to eliminate the local sta=
tfs file
            eventually.<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 * But, for now, we're simply not goi=
ng to update
            it by<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 * never marking its buffers dirty<br=
>
            &gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0if (!(bd-&gt;bd_gl-&gt;gl_name.ln_typ=
e =3D=3D
            LM_TYPE_INODE &amp;&amp;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bd-&gt;bd_gl-&gt=
;gl_object =3D=3D
            GFS2_I(sdp-&gt;sd_sc_inode)))<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mark_buff=
er_dirty(bh);<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clear_buffer_pinned(bh);<br>
            &gt;=C2=A0 <br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer_is_rgrp(bd))<br>
            &gt; --<br>
            &gt; 2.20.1<br>
            <br>
            Hi,<br>
            <br>
            This seems dangerous to me. It can only get to gfs2_unpin by
            trying to<br>
            commit buffers for a transaction. If the buffers aren't
            marked dirty,<br>
            that means transactions will be queued to the ail1 list that
            won't be<br>
            fully written. So what happens to them? Do they eventually
            get freed?<br>
            <br>
            I'm also concerned about a potential impact to performance,
            since<br>
            gfs2_unpin gets called with every metadata buffer that's
            used.<br>
            The additional if checks may not costs us much time-wise,
            but it's a<br>
            pretty hot function.<br>
            <br>
            Can't we accomplish the same thing by making function
            update_statfs()<br>
            never add the buffers to the transaction in the first place?<br=
>
            IOW, by just removing the line:<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 gfs2_trans_add_meta(m_ip-&gt;i_gl, =
m_bh);<br>
            That way we don't need to worry about its buffer getting
            pinned,<br>
            unpinned and queued to the ail.<br>
            <br>
            Regards,<br>
            <br>
            Bob Peterson<br>
            <br>
          </blockquote>
          <div>=C2=A0</div>
          <div><span class=3D"gmail_default"
              style=3D"font-family:monospace,monospace">Fair point. I'll
              post an updated version of this patch that </span>=C2=A0<span
              class=3D"gmail_default"
              style=3D"font-family:monospace,monospace">doesn't queue the
              buffer in the first place.</span></div>
          <div><span class=3D"gmail_default"
              style=3D"font-family:monospace,monospace"><br>
            </span></div>
          <div><span class=3D"gmail_default"
              style=3D"font-family:monospace,monospace">Cheers!<br>
              --Abhi</span></div>
        </div>
      </div>
    </blockquote>
    <p>You need to think about correctness at recovery time. It may be
      faster to not write the data into the journal for the local statfs
      file, but how will that affect recovery depending on whether that
      recovery is performed by either a newer or older kernel? Being
      backwards compatible might be more important in this case, so
      worth looking at carefully,</p>
    <p>Steve.</p>
    <p><br>
    </p>
  </body>
</html>

--------------6A82FC8291390462CE31D946--

