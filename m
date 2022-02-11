Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE154B2FB8
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Feb 2022 22:46:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644615973;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sqI38sOGjQkk/kdw5sRYev4nCDxf01vz6fuBqsYp2pU=;
	b=iG+m5WT9UvrPPJkfQqYwnVBX5m7IRyDsXSL8hg9mG/bMol+yMmeoCd4gEAy7VjgVjF4mZR
	rkASY1uOuDNRZfsYpMN6SaZ5eDbkENDAdNlgWlO++Y8vWjoLXOgXLHTDlZAF552fN31sN7
	WSi116wbUyCZ5rfsoq1WQtr85RSeV98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-gHbYCahQPwuJ6Yg_0nv6tA-1; Fri, 11 Feb 2022 16:46:10 -0500
X-MC-Unique: gHbYCahQPwuJ6Yg_0nv6tA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3516A801B2D;
	Fri, 11 Feb 2022 21:46:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0317D4D704;
	Fri, 11 Feb 2022 21:46:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8369D1809CBA;
	Fri, 11 Feb 2022 21:46:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BLf9Zn024682 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 16:41:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 02C9C40E7F11; Fri, 11 Feb 2022 21:41:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F30F840E7F04
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 21:41:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D08EE3C0012D
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 21:40:55 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-663-PdOIXmSCPOqCSkusKE3ZKQ-1; Fri, 11 Feb 2022 16:40:54 -0500
X-MC-Unique: PdOIXmSCPOqCSkusKE3ZKQ-1
Received: by mail-wm1-f72.google.com with SMTP id
	a17-20020a05600c069100b0037bb7eb6944so1048813wmn.2
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 13:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sqI38sOGjQkk/kdw5sRYev4nCDxf01vz6fuBqsYp2pU=;
	b=m0NXGOzYVq8/pOaZsDhXt7ciBlSqmwwt12kn0BULUrC5Sxn/hlx0Id2J3bhaOw0uRW
	3d2fHZq8ZfUNKnEkEwnqsH8PW2fSGJSR3TKsmEy5rbfiKONejnKeHuurgxA3L02xb7I1
	qqhWnArL73JhgQfKycnd0spL0y88c9rhK+l8VxWhKxyjLARsYLcI1ypGPp7vFEQEr5vc
	3ZJCZwCSFl1V5XIB0hYqEkoyFla4hiUvhHvhKHTdRTWo/lcWskJ0N2WNRu0t1XF02OLx
	EHX/suN3Ve448cvn36nktDEMCC/wwM+x8/8z5EFUPyNixLIxR+eNY6Z4UGEreFAkBMeO
	4NZw==
X-Gm-Message-State: AOAM533AXbkC46BEV1S6mdYsE++ybebSBLORT55404Ab3ap2NHd5qvic
	jXyKRZ10SmbAbBB3Mk90kDFETSHoTg3D4k6s5Eg0BshkUJA13QjHdCOmZ7vZyp3xyCXznc3STzL
	ThNWaOCAqoqhxF27DFUTgETg9gPByhqN9S1JRNw==
X-Received: by 2002:a05:6000:156b:: with SMTP id
	11mr2805498wrz.467.1644615652999; 
	Fri, 11 Feb 2022 13:40:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytKegG4uDbc7VzIalpGiz97r3Tl2ltFZoA4NB5ErmhhhrTxrr5fvHnN0bRc0eWbu1gFTg/xjMhuQKdmPWrAfM=
X-Received: by 2002:a05:6000:156b:: with SMTP id
	11mr2805493wrz.467.1644615652820; 
	Fri, 11 Feb 2022 13:40:52 -0800 (PST)
MIME-Version: 1.0
References: <20220211170522.348999-1-agruenba@redhat.com>
	<CAHk-=wgURPnzwmWtgT-WSrpfFX9_wx_ZsY1XWp1MehrUuBuNiQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgURPnzwmWtgT-WSrpfFX9_wx_ZsY1XWp1MehrUuBuNiQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 11 Feb 2022 22:40:41 +0100
Message-ID: <CAHc6FU7rMvu=Wry=VOXRv1191xooo+r8Cnv4XwYQysAr1hRFYw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 11, 2022 at 8:48 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Feb 11, 2022 at 9:05 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > * Revert debug commit that causes unexpected data corruption.
>
> Well, apparently not just unexpected, but unexplained too.
>
> That's a bit worrisome. It sounds like the corruption cause is still
> there, just hidden by the lack of __cond_resched()?

Yes, that's what it looks like. My initial suspicion was that we're
somewhere using gfs2_glock_dq() in non-sleepable context when we know
that we're not dropping the last reference and so gfs2_glock_dq()
won't sleep, but there's no such instance in the code, and testing
would also have revealed such cases. The corruption we've seen always
affects whole pages/blocks. Maybe it's an ordering / memory barrier
issue.

Thanks,
Andreas

