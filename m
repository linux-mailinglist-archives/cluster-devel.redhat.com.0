Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C9372FCE2E
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 19:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573757711;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VT58faYRunftJF29gk0MzQtaGn+DKTLe69xrKKNOkvs=;
	b=U92oKhI3Vkf6bDs4fczMX4Z7BYDZ5VIdnDEzJABFNKh/4ZSdMIVLvtY94cCGyHWucfhZfx
	Y6iFBzsnZLn/o7HymSbiww8GK+ddnsPLMik+Iv50kf12IfQMY6+vg3kI0cse1eDoM7dHHr
	MzKZsBpaEOSP+d2W46v8B4wy9un6bIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-jPHE2EzqO1OyjwprqBVPWQ-1; Thu, 14 Nov 2019 13:53:56 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98A6018A779B;
	Thu, 14 Nov 2019 18:53:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 174DB5E25E;
	Thu, 14 Nov 2019 18:53:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2560C4BB5C;
	Thu, 14 Nov 2019 18:53:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEIroWQ007620 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 13:53:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09C4C6764E; Thu, 14 Nov 2019 18:53:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EED26764C;
	Thu, 14 Nov 2019 18:53:47 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 859E04BB5B;
	Thu, 14 Nov 2019 18:53:47 +0000 (UTC)
Date: Thu, 14 Nov 2019 13:53:47 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <429182855.30077979.1573757627399.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU7-2qUokPXwRGBZPTRrv2xRkE47d8KYXGmUCkN3wVnyNw@mail.gmail.com>
References: <946265143.29711102.1573742986193.JavaMail.zimbra@redhat.com>
	<788089991.29722188.1573743135983.JavaMail.zimbra@redhat.com>
	<CAHc6FU7-2qUokPXwRGBZPTRrv2xRkE47d8KYXGmUCkN3wVnyNw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.7]
Thread-Topic: gfs2: Introduce function gfs2_withdrawn
Thread-Index: 67t9v16K5wDwEwM1cLY0Ug95a2dcaA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Introduce function
 gfs2_withdrawn
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: jPHE2EzqO1OyjwprqBVPWQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----
> On Thu, Nov 14, 2019 at 3:52 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > This patch adds function gfs2_withdrawn and replaces all checks
> > for the SDF_WITHDRAWN bit to call it. This does not change the
> > logic or function of gfs2, and it facilitates later improvements
> > to the withdraw sequence.
>=20
> This looks mostly okay, but:
>=20
> > +/**
> > + * gfs2_withdrawn - test whether the file system is withdrawing or
> > withdrawn
> > + * @sdp: the superblock
> > + */
> > +static inline bool gfs2_withdrawn(struct gfs2_sbd *sdp)
> > +{
> > +       if (test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
> > +               return true;
> > +       return false;
>=20
>       return test_bit(SDF_WITHDRAWN, &sdp->sd_flags)
>=20
> > +}
>=20
> Thanks,
> Andreas

Well, I can certainly do that, but this patch is a predecessor to
another that checks two bits instead of one. I could or them, of course.

