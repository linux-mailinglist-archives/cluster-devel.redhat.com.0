Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 37DA13CEB54
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 21:27:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-O_4BAWf0OTu7-Jg-OLW10g-1; Mon, 19 Jul 2021 15:27:02 -0400
X-MC-Unique: O_4BAWf0OTu7-Jg-OLW10g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9D891800D41;
	Mon, 19 Jul 2021 19:26:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D0AE10016F4;
	Mon, 19 Jul 2021 19:26:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCFBC4EA2A;
	Mon, 19 Jul 2021 19:26:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JJQpwm015794 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 15:26:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE0A3114B2E1; Mon, 19 Jul 2021 19:26:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8A4B10F8E3D
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 19:26:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C96DE96B049
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 19:26:48 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-320-eBmQnyDkNOmsx87NCPN3VQ-1; Mon, 19 Jul 2021 15:26:46 -0400
X-MC-Unique: eBmQnyDkNOmsx87NCPN3VQ-1
Received: by mail-lf1-f50.google.com with SMTP id m16so311174lfg.13
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 12:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K1xCs+r00YlYYmkHhfeZ23WXN1acy6oHwi3mHUNeu3k=;
	b=unn/GVxD6EEqJ0dzVBhKByNGRAm47JzjNYlj2kfLn2vpW3linzqGCPBE7zozNHptEF
	JDGrIqqfJRQMfMWbZbKL9ZBsT3EmxonpMRz9Fi3mHjuQsYu2/99qCalUgJt+adJaWZyH
	8/s8KANX0sbjDulFH+Hu/BVFZ64NriB4TUgaz+TpdlqCMvBzLvQZ7B3ZsfjDP8A65YtO
	LnXoSOs5PYqRuZUC2meGL7rHuYO+U4ONdV+ZFUE7YEi6/Iw+5kG9qzIscNA1bnAH14iP
	dn2uzL5qoKm78DPahh4kWW65NruzfMwP7ee5glBY9UT3s4zGgrUpk74JinZz8QFKyMzL
	GzRA==
X-Gm-Message-State: AOAM531AkDSWQm6cJUN3YTWFJtEvz2tlUkJiSi61P4r/IDgUWhrxLAEj
	88pTqFkaITvg+dsQXRIo5DWzFxbBHl3nvHt4
X-Google-Smtp-Source: ABdhPJyUCqif09/v5711Ef1DGP8YKfK+TbU0Y1GbcA9/pkngzcoodNcENK4fHsQlYaIFRtrtVvhJpA==
X-Received: by 2002:ac2:43b6:: with SMTP id t22mr3349566lfl.285.1626722804887; 
	Mon, 19 Jul 2021 12:26:44 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
	[209.85.167.45]) by smtp.gmail.com with ESMTPSA id
	y24sm1358909lfe.255.2021.07.19.12.26.43
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 19 Jul 2021 12:26:44 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id y42so32077756lfa.3
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 12:26:43 -0700 (PDT)
X-Received: by 2002:ac2:4475:: with SMTP id y21mr18958429lfl.487.1626722803588;
	Mon, 19 Jul 2021 12:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210718223932.2703330-1-agruenba@redhat.com>
	<20210718223932.2703330-2-agruenba@redhat.com>
In-Reply-To: <20210718223932.2703330-2-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Jul 2021 12:26:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxmBjwU+NpeVnUrMEgqk7qAF0VRwtXS2YPJo2n3WGyWg@mail.gmail.com>
Message-ID: <CAHk-=whxmBjwU+NpeVnUrMEgqk7qAF0VRwtXS2YPJo2n3WGyWg@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v2 1/6] iov_iter: Introduce
	fault_in_iov_iter helper
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

On Sun, Jul 18, 2021 at 3:39 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Introduce a new fault_in_iov_iter helper for manually faulting in an iterator.
> Other than fault_in_pages_writeable(), this function is non-destructive.

You mean "Unlike" rather than "Other than" (also in the comment of the patch).

This is fairly inefficient, but as long as it's the exceptional case,
that's fine. It might be worth making that very explicit, so that
people don't try to use it normally.

                Linus

