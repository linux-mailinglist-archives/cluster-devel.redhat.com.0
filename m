Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CCE621F03E0
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DBAk2fXeIJ5DzX3HlDD1qnqnc79Hn8S2Wf90Soa+usQ=;
	b=aStTJ86wtAyj9irZnK0A/+Vdk4nwOAX+OQA0UhaxUtSmEpJRKOubfQ6ciWmA3tO//RxMLT
	XjMn75OHcArnHiX571lAThELwDtoFSsf/Zk6GnzuD5P8vVbWzzbu2L3lZnAsFiKdwJfrDS
	c0GUnp8d9Hk2rxftu1hGdquSyGIwPzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-962AVv37NmOA_201h4yKaw-1; Fri, 05 Jun 2020 20:23:55 -0400
X-MC-Unique: 962AVv37NmOA_201h4yKaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B52581005510;
	Sat,  6 Jun 2020 00:23:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A65665F9DB;
	Sat,  6 Jun 2020 00:23:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9314A1809547;
	Sat,  6 Jun 2020 00:23:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055GIJY0018105 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:18:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F37810F26E9; Fri,  5 Jun 2020 16:18:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B04D10F26EE
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:18:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52EC71049840
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:18:17 +0000 (UTC)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
	[209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-186-1YOX_mKuOtesky3DrgQ4mw-1; Fri, 05 Jun 2020 12:18:15 -0400
X-MC-Unique: 1YOX_mKuOtesky3DrgQ4mw-1
Received: by mail-oo1-f70.google.com with SMTP id v9so5477700oov.1
	for <cluster-devel@redhat.com>; Fri, 05 Jun 2020 09:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DBAk2fXeIJ5DzX3HlDD1qnqnc79Hn8S2Wf90Soa+usQ=;
	b=C0KztshdCPaa0lCffEN2xK0BjvHCn/PdYhPsF7K58NaOk4tnf+w4MaAiocRX/g85pA
	vaaBZEAfcpAMO9ldYN3TTmVuO9ynXEn8O8Z/kBw2zk9KJZX0+SMm0GU0IFiOzhEnzL7F
	AG7naPsTRzt122Z2sdW9rbdrjXNEE0TnvKUgtnt1edaKmXShT+CcLmc2QiQbvGuTRLPe
	tcgwEuV8U9ced+VWhVo/UhpL9MZfsV+jsofuHmA41+Z5aL9aT/yZWip6rp/dq6EQs4EP
	CKA9XuGuAESyFqyr/dMmCGAt6LxKikzrnS+8PMK1k7xTU78lbNDvbI/rhgIbOpbrsVxa
	CIhw==
X-Gm-Message-State: AOAM531wXoM+fPvbSKMkkMLVN8qTLN+J8b94FCJOL/TmIzRmLTNZxHgl
	RDTrLAY5FtAGFLM1jzTurFL8bsPlsuGTbzcp+Prksm8+TR1nf/a9zcz4cANiRsXpUb+cc2a+FzV
	e3CnUK0iax6SkUjm6S9n3tOycf+jfw0CpmfOkdw==
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr7300480otr.58.1591373894307; 
	Fri, 05 Jun 2020 09:18:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsdsbd8wuwSwo4JJQ+S0pV+04GLfNSerUodcE7P4+Xcc21FltVmHpuhz8A46T1TJme54x6/kgxr9NNt0ijeFQ=
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr7300464otr.58.1591373894066; 
	Fri, 05 Jun 2020 09:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200526130536.295081-1-rpeterso@redhat.com>
	<20200526130536.295081-7-rpeterso@redhat.com>
	<CAHc6FU6Zo3gQCRt=rj8Xf3yyf4T8uX1vfHL9L1DJy3L90XkARQ@mail.gmail.com>
	<435435062.31970561.1591368532509.JavaMail.zimbra@redhat.com>
	<CAHc6FU6w_yu9VDC=ci2Yb6F3ngjF4DkT=SjB1ovkBTmd0O=76Q@mail.gmail.com>
	<1003983013.31986358.1591373697538.JavaMail.zimbra@redhat.com>
In-Reply-To: <1003983013.31986358.1591373697538.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 5 Jun 2020 18:18:03 +0200
Message-ID: <CAHc6FU42nQA9N_+p_QoXiiRK9cU+0MUoaLZbVh5FUn_3Wn0FVg@mail.gmail.com>
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

On Fri, Jun 5, 2020 at 6:15 PM Bob Peterson <rpeterso@redhat.com> wrote:
> ----- Original Message -----
> > On Fri, Jun 5, 2020 at 4:49 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > > Hi Andreas,
> > >
> > > ----- Original Message -----
> > > (snip)
> > > > > @@ -970,7 +969,16 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct
> > > > > gfs2_glock *gl, u32 flags)
> > > > >
> > > > >         if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
> > > > >                 if (!sdp->sd_log_idle) {
> > > > > +                       unsigned long start = jiffies;
> > > > > +
> > > > >                         for (;;) {
> > > > > +                               if (time_after(jiffies, start + (HZ *
> > > > > 600))) {
> > > >
> > > > This should probably have some rate limiting as well, for example:
> > >
> > > Seems unnecessary. If the log flush gets stuck, the message will be printed
> > > once, and at most every 10 minutes.
> >
> > No, after ten minutes, the message will actually be printed for each
> > iteration of the loop. That's exactly why I was suggesting the rate
> > limiting.
>
> No, after ten minutes it dumps the ail list so you can see the problem
> and exits the loop with "break;".
>
> The next time it enters the loop, it starts with a new value of start
> which doesn't expire for another ten minutes.

Ok, I misread.

Thanks,
Andreas

