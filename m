Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DAE473654DD
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Apr 2021 11:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618909781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8028DMkcvTFQAUGxYu0XMY4FzPiiyAVvMhfk3yuE2W8=;
	b=QfUEMLcP3oINx7+Nf0BBLTaZUlEeJj+RXtcbepYoto9iJsvdI4BiPrgFnwET7zWjLX9YYa
	csQmU7wx11YTc5QA8RXowz9SnPLpRZhzVrR0nAvtxtqLaQtsn3M7X4HMwsEAT8e2Nsf/x9
	l1zBsXS0kcm1sxjiCYZkGIijz8+EJk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-o2zhsLQ7Oq-CY9SVOq5WMA-1; Tue, 20 Apr 2021 05:09:38 -0400
X-MC-Unique: o2zhsLQ7Oq-CY9SVOq5WMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2F038143F2;
	Tue, 20 Apr 2021 09:09:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D73FD610F1;
	Tue, 20 Apr 2021 09:09:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5ED761806D16;
	Tue, 20 Apr 2021 09:09:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13K9842e005147 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 05:08:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44BD882877; Tue, 20 Apr 2021 09:08:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8F380566
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 09:08:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B746B80A1D3
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 09:08:00 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-356-Yiimq2h3PqixGZ0Eql4Tfw-1; Tue, 20 Apr 2021 05:07:45 -0400
X-MC-Unique: Yiimq2h3PqixGZ0Eql4Tfw-1
Received: by mail-wr1-f71.google.com with SMTP id
	t14-20020a5d6a4e0000b029010277dcae0fso10513312wrw.22
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 02:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8028DMkcvTFQAUGxYu0XMY4FzPiiyAVvMhfk3yuE2W8=;
	b=OSkSm6oszp7miCt8loWaVoPdGVfebX+1LaE4+bdz3+PkfZ/iT6kifsbyJqiqJeTUw7
	xDf0rN5mZ7PC1yWVHJ3kZ6ejzmhprdIuLqfx0V0E5VLUbNffvbiR7F8znWLmZup5f16h
	zfJg/+dLMJSsbJeAAQ7IBRJOSRHooeXj0HwRdLxPJccE/DhBK4fnez9GlWcrhV9Ox6wS
	kJ+bC66g5giRfmgi+Tju4/WnCrLm3WZr5pS/9YSOl/6DiUxgGYdH3Jxt46ke5p98RnxZ
	FkR2ADf3n9TwX2mdvl6MV16pE4IMulgvulMoJ2wf/oNptLOEbDvhm+94X2zs1ax0MC6j
	5z2Q==
X-Gm-Message-State: AOAM533UImZHL2VjA/FevukQeHqbHmatxiUFbqEqdaOchlY8D8ZnDQQY
	Clv+RjnJDqPkbi1ohDG4w/qmRaieIj/x2HEOkN7ouLatJMDisEdf+QfF6k86P+r2F4w/nJmHZRd
	4LQH/NiXcQV/cK3woK2A/vh1KyYW9nk30qOzKFQ==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr18553189wrg.376.1618909664202; 
	Tue, 20 Apr 2021 02:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlhcI7HNFlJbfnr9xRH0rqTtH7STZr8NMAD1AMcRT9rWaiHbMGBq72tr4DlZZ4hwFY+QfnjNrr22nFHRiuuOc=
X-Received: by 2002:adf:84e6:: with SMTP id 93mr18553179wrg.376.1618909664079; 
	Tue, 20 Apr 2021 02:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210419191117.297653-1-anprice@redhat.com>
	<20210419191117.297653-2-anprice@redhat.com>
	<CAHc6FU6+DNareW3Zb_=A9vsct07CcSm9DOcWWoiyv0Pg7NO=kQ@mail.gmail.com>
	<9472a989-1265-65d2-292b-5110176c15c6@redhat.com>
	<CAHc6FU5xAryzhtp+yniEU=cLaZH=mu1+woc76YLo_NrsRMj+iw@mail.gmail.com>
	<8ac4383c-c510-203a-8a47-834c218b1d97@redhat.com>
In-Reply-To: <8ac4383c-c510-203a-8a47-834c218b1d97@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 20 Apr 2021 11:07:33 +0200
Message-ID: <CAHc6FU4dNtA6Tj-r=sT-WuQxabn4WoUh26GQh+WMt+TYsoYPDQ@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 1/8] Import linux/gfs2_ondisk.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 10:34 AM Andrew Price <anprice@redhat.com> wrote:
> On 20/04/2021 07:00, Andreas Gruenbacher wrote:
> > On Mon, Apr 19, 2021 at 10:47 PM Andrew Price <anprice@redhat.com> wrote:
> >> On 19/04/2021 20:35, Andreas Gruenbacher wrote:
> >>> Andy,
> >>>
> >>> On Mon, Apr 19, 2021 at 9:11 PM Andrew Price <anprice@redhat.com> wrote:
> >>>> diff --git a/gfs2/include/gfs2_ondisk.h b/gfs2/include/gfs2_ondisk.h
> >>>> new file mode 100644
> >>>> index 00000000..fc948f89
> >>>> --- /dev/null
> >>>> +++ b/gfs2/include/gfs2_ondisk.h
> >>>
> >>> any reason why this file shouldn't be at gfs2/include/linux/gfs2_ondisk.h?
> >>
> >> I didn't feel it was needed, but it does have the benefit of making sure
> >> we're not picking up the system linux/gfs2_ondisk.h when we #include
> >> <gfs2_ondisk.h> and it shows clearly that we're not trying to.
> >
> > Well, we have "-I$(top_srcdir)/gfs2/include" in CPPFLAGS so
> > gfs2/include/linux/types.h is picked up by <linux/types.h>. We already
> > rely on that working. So gfs2/include/linux/gfs2_ondisk.h would be
> > picked up by <linux/gfs2_ondisk.h> already anyway.
>
> So, what would be the advantage of having gfs2_ondisk.h in
> gfs2/include/linux/? I put types.h in that directory because I didn't
> want to change the #include statement, but I didn't see a reason to put
> gfs2_ondisk.h in there.

It's more consistent if the definitions are always included as
<linux/gfs2_ondisk.h> by the kernel and by all user-space programs.

Andreas

