Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 20841FE432
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 18:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573839593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MevkggYXrBzuwYNaaZtYswxwCOmJ/2z/oxbJ5WueaM4=;
	b=YG1ytBYIkf+1E6sZ8QtHHYiwvjJ4FKijvSsyXM0UX9tFWuHUSdMgzvGyrzcFz7CqtT0QAw
	TuAtGqyDDMErGpINVkMdxk8ge2FnMDib4CR6FwnHCKSZHQNg5qgkC5lUcGz4AmHosaMVfs
	D3hphrj6BHtaXNyUEaaUuRmYslouVmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-e-wKZBkFMRSk417IbrqFrA-1; Fri, 15 Nov 2019 12:39:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E04A1005502;
	Fri, 15 Nov 2019 17:39:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E73991036C85;
	Fri, 15 Nov 2019 17:39:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 020044BB5B;
	Fri, 15 Nov 2019 17:39:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFHdiKp012934 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 12:39:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A65D55D6D8; Fri, 15 Nov 2019 17:39:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D0D85D6D0;
	Fri, 15 Nov 2019 17:39:42 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 124BC18089C8;
	Fri, 15 Nov 2019 17:39:42 +0000 (UTC)
Date: Fri, 15 Nov 2019 12:39:41 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <491033255.30283381.1573839581928.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU5zTfvnqjrhQ13Jid79Vfqrk68X_FusUwRyczgAfu3xMA@mail.gmail.com>
References: <1819526286.30262006.1573832637022.JavaMail.zimbra@redhat.com>
	<1255360710.30262128.1573832741690.JavaMail.zimbra@redhat.com>
	<CAHc6FU5zTfvnqjrhQ13Jid79Vfqrk68X_FusUwRyczgAfu3xMA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.6]
Thread-Topic: gfs2: Close timing window with GLF_INVALIDATE_IN_PROGRESS
Thread-Index: onbOIBmOqeHabRdQkhW36gkhEAgTsQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Close timing window with
 GLF_INVALIDATE_IN_PROGRESS
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: e-wKZBkFMRSk417IbrqFrA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----
> On Fri, Nov 15, 2019 at 4:45 PM Bob Peterson <rpeterso@redhat.com> wrote:
> >
> > Hi,
> >
> > This patch closes a timing window in which two processes compete
> > and overlap in the execution of do_xmote for the same glock:
> >
> >              Process A                              Process B
> >    ------------------------------------   -----------------------------
> > 1. Grabs gl_lockref and calls do_xmote
> > 2.                                        Grabs gl_lockref but is block=
ed
> > 3. Sets GLF_INVALIDATE_IN_PROGRESS
> > 4. Unlocks gl_lockref
> > 5.                                        Calls do_xmote
> > 6. Call glops->go_sync
> > 7. test_and_clear_bit GLF_DIRTY
> > 8. Call gfs2_log_flush                    Call glops->go_sync
> > 9. (slow IO, so it blocks a long time)    test_and_clear_bit GLF_DIRTY
> >                                           It's not dirty (step 7) retur=
ns
> > 10.                                       Tests GLF_INVALIDATE_IN_PROGR=
ESS
> > 11.                                       Calls go_inval (rgrp_go_inval=
)
> > 12.                                       gfs2_rgrp_relse does brelse
> > 13.                                       truncate_inode_pages_range
> > 14.                                       Calls lm_lock UN
> >
> > In step 14 we've just told dlm to give the glock to another node
> > when, in fact, process A has not finished the IO and synced all
> > buffer_heads to disk and make sure their revokes are done.
> >
> > This patch fixes the problem by changing the GLF_INVALIDATE_IN_PROGRESS
> > to use test_and_set_bit, and if the bit is already set, process B just
> > ignores it and trusts that process A will do the do_xmote in the proper
> > order.
> >
> > Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> > ---
> >  fs/gfs2/glock.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> > index faa88bd594e2..4a4a390ffd00 100644
> > --- a/fs/gfs2/glock.c
> > +++ b/fs/gfs2/glock.c
> > @@ -558,7 +558,19 @@ __acquires(&gl->gl_lockref.lock)
> >         GLOCK_BUG_ON(gl, gl->gl_state =3D=3D gl->gl_target);
> >         if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERR=
ED) &&
> >             glops->go_inval) {
> > -               set_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
> > +               /*
> > +                * If another process is already doing the invalidate w=
e
> > should
> > +                * not interfere. If we call go_sync and it finds the g=
lock
> > is
> > +                * not dirty, we might call go_inval prematurely before=
 the
> > +                * other go_sync has finished with its revokes. If we t=
hen
> > call
> > +                * lm_lock prematurely, we've really screwed up: we can=
not
> > tell
> > +                * dlm to give the glock away until we're synced and
> > +                * invalidated. Best thing is to return and trust the o=
ther
> > +                * process will finish do_xmote tasks in their proper
> > order.
> > +                */
>=20
> That's a bit too much information here. Can we please change that as foll=
ows?
>=20
>                 * If another process is already doing the invalidate, let
>                 that
>                 * finish first.  The glock state machine will get back to
>                 this
>                 * holder again later.
>=20
> > +               if (test_and_set_bit(GLF_INVALIDATE_IN_PROGRESS,
> > +                                    &gl->gl_flags))
> > +                       return;
> >                 do_error(gl, 0); /* Fail queued try locks */
> >         }
> >         gl->gl_req =3D target;
> >
>=20
> Thanks,
> Andreas
>=20
>=20
Sure. Make it so.

Bob

