Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3EF1F03EB
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403120;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=siDO/ydewU74ydwE0/i8s0FLQXkPGb/dJ2/9/OquqN0=;
	b=CDyJ+tjxmucYtSs00jNsLqn3H3xp7P6SGoqUENtnyXJw6GumnkbZdle90wqb39Yv1XwQcJ
	frl2kVnKDBxFJoJH2/vwBWPGKPw7ScL/Sq/NnlG/G2/WoU6kYx7hrM8LzXdGci8izQegdN
	PW9T5yhELcEyLfJucC5hMtoFcA+KkdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-X8ap-OC7MkC9kDkReegZmg-1; Fri, 05 Jun 2020 20:24:04 -0400
X-MC-Unique: X8ap-OC7MkC9kDkReegZmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 116361009628;
	Sat,  6 Jun 2020 00:24:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00E1A5F9DB;
	Sat,  6 Jun 2020 00:24:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFF80104912;
	Sat,  6 Jun 2020 00:24:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055G9q9R017402 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:09:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81B0910F26ED; Fri,  5 Jun 2020 16:09:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B33310F26E9
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:09:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66825800FFE
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:09:50 +0000 (UTC)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
	[209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-507-EIK5VkQlOQ-RqI2tTfpOkg-1; Fri, 05 Jun 2020 12:09:48 -0400
X-MC-Unique: EIK5VkQlOQ-RqI2tTfpOkg-1
Received: by mail-oo1-f70.google.com with SMTP id z12so549928oon.16
	for <cluster-devel@redhat.com>; Fri, 05 Jun 2020 09:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=siDO/ydewU74ydwE0/i8s0FLQXkPGb/dJ2/9/OquqN0=;
	b=RuNRB8Pp6I1QlnUeQOnsI85udsEVmVIxpQUREyVNZqVZ6Yrjy4kjDS6FBMOJjOSyHC
	LuH76uKj/jSbEir72ZzzjrkCPoExCz8fixBlq1GFqTEs0CO91GxvIQp6T5DUFFGNWiF6
	u99RXMi5o4QT0h1zLINtiEabsxAQRHUCE7PDHjEj4Q/5j3aStl8f7Fg0Q3hzOTVhRy9l
	DWZ6IpF2UkmotsMj4GX2SHACrNvKm5GEjLEAiMxByRkEThPIjk5sPsN6X5b7H7Ya/8/l
	ySTgqiCW9kPivnpBk7rMMMjsp7SivGx2+bQqamtU+YgwTKjXmaH8Nep9g5uflOpwXGJN
	w8fA==
X-Gm-Message-State: AOAM5334qC5wtRzN6CFmZIOSnHW5m6QESey0M0aeKc9XTJTjvQ47dQAC
	lc6pX2ACrynT01o3ToHNRPK6yhTG+P2QxRW/Kwk69GTsLWaCuttqaIjV+hj0cl9SCHbCTkO3tjl
	Iho5evLTOZcyx5fyNsg3vEH+5RiuIUXVLJgX0pg==
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr7272974otr.58.1591373387889; 
	Fri, 05 Jun 2020 09:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYN4+fVPq0HN01JJLiQk+9T9hia3mQCYpwLg1lBlWPEGbhYGgIQVL3vVfdJFe/GghMI0t2whG2PcGknXTQGr4=
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr7272955otr.58.1591373387662; 
	Fri, 05 Jun 2020 09:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200526130536.295081-1-rpeterso@redhat.com>
	<20200526130536.295081-7-rpeterso@redhat.com>
	<CAHc6FU6Zo3gQCRt=rj8Xf3yyf4T8uX1vfHL9L1DJy3L90XkARQ@mail.gmail.com>
	<435435062.31970561.1591368532509.JavaMail.zimbra@redhat.com>
In-Reply-To: <435435062.31970561.1591368532509.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 5 Jun 2020 18:09:36 +0200
Message-ID: <CAHc6FU6w_yu9VDC=ci2Yb6F3ngjF4DkT=SjB1ovkBTmd0O=76Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 5, 2020 at 4:49 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Hi Andreas,
>
> ----- Original Message -----
> (snip)
> > > @@ -970,7 +969,16 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct
> > > gfs2_glock *gl, u32 flags)
> > >
> > >         if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
> > >                 if (!sdp->sd_log_idle) {
> > > +                       unsigned long start = jiffies;
> > > +
> > >                         for (;;) {
> > > +                               if (time_after(jiffies, start + (HZ *
> > > 600))) {
> >
> > This should probably have some rate limiting as well, for example:
>
> Seems unnecessary. If the log flush gets stuck, the message will be printed
> once, and at most every 10 minutes.

No, after ten minutes, the message will actually be printed for each
iteration of the loop. That's exactly why I was suggesting the rate
limiting.

> >                                         start = jiffies;
> >
> > I'm not sure what provides similar rate limiting in gfs2_ail1_flush.
> >
> > > +                                       fs_err(sdp, "Error: In
> > > gfs2_log_flush "
> > > +                                              "for 10 minutes! t=%d\n",
> > > +                                              current->journal_info ? 1 :
> > > 0);
> >
> > Please don't break the format string up like that; this makes grepping
> > harder.
>
> How do you propose I break present it without going over 80 character?
> I could #define it as a constant, or put it into a separate function
> that has less indentation, I suppose.

There *is* no hard 80 character limit. The checkpatch warnings
shouldn't push us into making our code worse. Also note that since
commit bdc48fa11e, checkpatch will only warn about lines longer than
100 characters.

Thanks,
Andreas

