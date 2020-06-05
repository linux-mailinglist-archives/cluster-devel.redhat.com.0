Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 133E21F03DD
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YAXQ7OjGC5gYFW/PTUFPb3Ohy/lnl2GsFq+yp7UBhas=;
	b=FQnuZ1oh70difQ7V5KtllOazBqUTZWD9gEqc94zM6Un82PFlky9IQBU9An16Zg+pXRwwCs
	iA0LWt7xcFmBZonkbmBRoW+GgS7PnPZkL1SbvsPLwWr89FBmIJ8m/unwwlgzKWg3x0FAEC
	L+DzsGA5mHjDoDH9zj1x3b5v27OFUdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-AXqLMwKmMmuTSrBSjrdu6g-1; Fri, 05 Jun 2020 20:23:45 -0400
X-MC-Unique: AXqLMwKmMmuTSrBSjrdu6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61BDBEC1AA;
	Sat,  6 Jun 2020 00:23:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 524C478F0D;
	Sat,  6 Jun 2020 00:23:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F0641800FF1;
	Sat,  6 Jun 2020 00:23:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Emx5e009023 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 10:48:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D0A2108D6; Fri,  5 Jun 2020 14:48:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E06D108D7;
	Fri,  5 Jun 2020 14:48:54 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0FB2ADABD;
	Fri,  5 Jun 2020 14:48:54 +0000 (UTC)
Date: Fri, 5 Jun 2020 10:48:52 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <435435062.31970561.1591368532509.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU6Zo3gQCRt=rj8Xf3yyf4T8uX1vfHL9L1DJy3L90XkARQ@mail.gmail.com>
References: <20200526130536.295081-1-rpeterso@redhat.com>
	<20200526130536.295081-7-rpeterso@redhat.com>
	<CAHc6FU6Zo3gQCRt=rj8Xf3yyf4T8uX1vfHL9L1DJy3L90XkARQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.80, 10.4.195.13]
Thread-Topic: gfs2: instrumentation wrt log_flush stuck
Thread-Index: Q1VIv0iloAzgRenz+9iciqLla6cX1A==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Andreas,

----- Original Message -----
(snip)
> > @@ -970,7 +969,16 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct
> > gfs2_glock *gl, u32 flags)
> >
> >         if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
> >                 if (!sdp->sd_log_idle) {
> > +                       unsigned long start = jiffies;
> > +
> >                         for (;;) {
> > +                               if (time_after(jiffies, start + (HZ *
> > 600))) {
> 
> This should probably have some rate limiting as well, for example:

Seems unnecessary. If the log flush gets stuck, the message will be printed
once, and at most every 10 minutes.
 
>                                         start = jiffies;
> 
> I'm not sure what provides similar rate limiting in gfs2_ail1_flush.
> 
> > +                                       fs_err(sdp, "Error: In
> > gfs2_log_flush "
> > +                                              "for 10 minutes! t=%d\n",
> > +                                              current->journal_info ? 1 :
> > 0);
> 
> Please don't break the format string up like that; this makes grepping
> harder.

How do you propose I break present it without going over 80 character?
I could #define it as a constant, or put it into a separate function
that has less indentation, I suppose.
 
Bob

