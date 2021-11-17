Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B0455166
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Nov 2021 01:00:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-x5DsBRu9NJ6aq4Q1ykKmDQ-1; Wed, 17 Nov 2021 19:00:30 -0500
X-MC-Unique: x5DsBRu9NJ6aq4Q1ykKmDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 396B71922965;
	Thu, 18 Nov 2021 00:00:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F58C100EBAD;
	Thu, 18 Nov 2021 00:00:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 323254EA2A;
	Thu, 18 Nov 2021 00:00:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHNuDjt006193 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 18:56:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ED1FC4010FE9; Wed, 17 Nov 2021 23:56:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C4640CFD05
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 23:56:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB8A4185A7B4
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 23:56:12 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-553-u1W3PKpZPE6QYBnpcFp2OA-1; Wed, 17 Nov 2021 18:56:10 -0500
X-MC-Unique: u1W3PKpZPE6QYBnpcFp2OA-1
Received: by mail-ed1-f41.google.com with SMTP id y12so18481198eda.12
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 15:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LWnFI7xMunJXtYruzgWcAa9iAQiJ7OsPSH6QXO/CtU4=;
	b=UIgM7U20/mHidp/R6TPuzsU0zzSui7TnHf/uBPSBl18Zp42sDkzmXUO+TaiUL3fbDv
	g0i2DE10Wwd44ODg1AhxjxD/onvxRhI9kzTAi4+v99NXoOskKde2OJmFwqXtGUbJXAom
	qxZbnTb5+om/PMKNHGI8nwKCEe/dCMd2YVJ5padc7mS2hR+0hHrSBOVsEi3ODp6CsRSO
	M7rlWS0Y5HmNKraPQeq661KUFjS0sVbkB2k0GXVp6B/XAWgZiXhw9Wro6GJXGfOxuhQ6
	zPtl/kJBpE7xNfUGPA81fDG9/PFPKb7PvXe/qxA55G5Hl6eWkhScF0Nb9Rm7IuHJBuB+
	VpfQ==
X-Gm-Message-State: AOAM533DwWaqCyChZn5M5YpHWNK+NCGFKxLEKKJ8rlqIMvvN/gTtZUwE
	LKEupqZBe1X7LQt72+54FFgl7hNG1EtIt11I
X-Google-Smtp-Source: ABdhPJyJ0dIgslEQR+eXfERf9xijU0ZEUT1FA1L/SoE8dtby4Tgq8D5G/L4t6NB5u1jwAvieHc4IIA==
X-Received: by 2002:a05:6402:5206:: with SMTP id
	s6mr4348542edd.2.1637193368865; 
	Wed, 17 Nov 2021 15:56:08 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
	[209.85.128.44])
	by smtp.gmail.com with ESMTPSA id i8sm793665edc.12.2021.11.17.15.56.08
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 17 Nov 2021 15:56:08 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
	f7-20020a1c1f07000000b0032ee11917ceso3429108wmf.0
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 15:56:08 -0800 (PST)
X-Received: by 2002:a1c:7405:: with SMTP id p5mr4358090wmc.152.1637193368169; 
	Wed, 17 Nov 2021 15:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20211117233656.77861-1-agruenba@redhat.com>
In-Reply-To: <20211117233656.77861-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 17 Nov 2021 15:55:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgx=75CTbsK3NzVhNVihw-P+U2gLekNJW-p-Tm2qc9_nQ@mail.gmail.com>
Message-ID: <CAHk-=wgx=75CTbsK3NzVhNVihw-P+U2gLekNJW-p-Tm2qc9_nQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fixes for v5.16-rc2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 3:37 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> We have a choice here between the proper fix in iomap_write_iter and
> generic_perform_write and this patch, which is just a workaround.  I've tried
> to get your feedback on this before:

Well, you did get Catalin's feedback, and I didn't have any strong
opinions on it, so..

I do think that iomap_write_iter() should be fixed, but I also agree
with your "by now too late", so I've pulled your gfs2 workaround.

          Linus

