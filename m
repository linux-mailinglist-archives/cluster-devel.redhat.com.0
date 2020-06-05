Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EA7511F03E4
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403046;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XlfxdqdDtueG8mvPvH0NxdxKG/D7KvzgVK4u93KzwnA=;
	b=FQU9D4FvoqMm28fFwBawIr6iXpW/nKytc9WVS5q4E2oOOdfVTtvZ/8iZ6d9P0bhWJhexvX
	4wV+jWclmM8DJkFapBkV3PRkfP5lohl8L66DxbKr1c6PpiqsF2/eC/PJyN9/GN6HtC1l3D
	cSi9hlR/GnK/yOYmRTQ2eMa94xloxFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-bQkjQA-bNrqP1n68jkgOGA-1; Fri, 05 Jun 2020 20:24:05 -0400
X-MC-Unique: bQkjQA-bNrqP1n68jkgOGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801AD1009616;
	Sat,  6 Jun 2020 00:24:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D5587B608;
	Sat,  6 Jun 2020 00:24:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BACA104913;
	Sat,  6 Jun 2020 00:24:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055GF324017799 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:15:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD2481011396; Fri,  5 Jun 2020 16:15:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7368D101E1BF;
	Fri,  5 Jun 2020 16:14:59 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A78718095FF;
	Fri,  5 Jun 2020 16:14:59 +0000 (UTC)
Date: Fri, 5 Jun 2020 12:14:57 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1003983013.31986358.1591373697538.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU6w_yu9VDC=ci2Yb6F3ngjF4DkT=SjB1ovkBTmd0O=76Q@mail.gmail.com>
References: <20200526130536.295081-1-rpeterso@redhat.com>
	<20200526130536.295081-7-rpeterso@redhat.com>
	<CAHc6FU6Zo3gQCRt=rj8Xf3yyf4T8uX1vfHL9L1DJy3L90XkARQ@mail.gmail.com>
	<435435062.31970561.1591368532509.JavaMail.zimbra@redhat.com>
	<CAHc6FU6w_yu9VDC=ci2Yb6F3ngjF4DkT=SjB1ovkBTmd0O=76Q@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.80, 10.4.195.23]
Thread-Topic: gfs2: instrumentation wrt log_flush stuck
Thread-Index: V4kQbStTscCFxHBniGvemvi7g6A50A==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 6/8] gfs2: instrumentation wrt log_flush
 stuck
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On Fri, Jun 5, 2020 at 4:49 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > Hi Andreas,
> >
> > ----- Original Message -----
> > (snip)
> > > > @@ -970,7 +969,16 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct
> > > > gfs2_glock *gl, u32 flags)
> > > >
> > > >         if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
> > > >                 if (!sdp->sd_log_idle) {
> > > > +                       unsigned long start = jiffies;
> > > > +
> > > >                         for (;;) {
> > > > +                               if (time_after(jiffies, start + (HZ *
> > > > 600))) {
> > >
> > > This should probably have some rate limiting as well, for example:
> >
> > Seems unnecessary. If the log flush gets stuck, the message will be printed
> > once, and at most every 10 minutes.
> 
> No, after ten minutes, the message will actually be printed for each
> iteration of the loop. That's exactly why I was suggesting the rate
> limiting.

No, after ten minutes it dumps the ail list so you can see the problem
and exits the loop with "break;".

The next time it enters the loop, it starts with a new value of start
which doesn't expire for another ten minutes.

Bob

