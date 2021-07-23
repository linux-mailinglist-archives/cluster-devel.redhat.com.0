Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 731EE3D436E
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 01:40:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-RVmK7a0cMNGEBuSdKqpmcQ-1; Fri, 23 Jul 2021 19:40:55 -0400
X-MC-Unique: RVmK7a0cMNGEBuSdKqpmcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7243A185302A;
	Fri, 23 Jul 2021 23:40:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3CFC10016F2;
	Fri, 23 Jul 2021 23:40:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27CB8180B7A2;
	Fri, 23 Jul 2021 23:40:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16NNel1L007372 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 23 Jul 2021 19:40:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E66042062A97; Fri, 23 Jul 2021 23:40:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E25AC2062A92
	for <cluster-devel@redhat.com>; Fri, 23 Jul 2021 23:40:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E9A289C7DC
	for <cluster-devel@redhat.com>; Fri, 23 Jul 2021 23:40:43 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-484-DjlmlFb8MmauRJZOVVXi8A-1; Fri, 23 Jul 2021 19:40:41 -0400
X-MC-Unique: DjlmlFb8MmauRJZOVVXi8A-1
Received: by mail-lj1-f177.google.com with SMTP id f12so3633280ljn.1
	for <cluster-devel@redhat.com>; Fri, 23 Jul 2021 16:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7xkMQPx7Z/4PMvWsEiJNAXvxh1Yr4z8dYX5ZnaiIDS4=;
	b=o/wG2gxcS5r2AjPRa4kyvTz/w5Z4CAOMz/5fKOVoQyOAsjgNbnduOfmalS/iewEnN3
	zu6az4IIxJOkzopyC8RalyEEWJnak5XJFeQzwNHbs7II2SMJAs8y800VK4Wun9nIOkM/
	G9LH7NCmFwCjDjAwtkL0NcCyYC21i3afRUhM9w8uz2p9o2BlfOVqpJK5H/o1cPWmFS/9
	FjCHn/fUJCuyX857Csag2R+Nu8Pc4NEfuuZS6WqDGHWZCEeNkSNZZdBP30fcT5jA7Ykx
	3LXmPZMIDdFscrUpSDAPLI1ndOGPJEn/36G5W+6L74vMc/k0ObTGObuNQuNnPGJfU37y
	A5cQ==
X-Gm-Message-State: AOAM533qGyfXT6UcBY07ZWSrpVI2F3aZf4u0vszrkXyFHFg2ngL1OZJK
	sB6PwFoDVArMQD4e2vr6WyqbahaKCLtvIIIU
X-Google-Smtp-Source: ABdhPJzSHXMu2IWZBK3+KlYQKVmB2yZscXM55TOnj2zeM6M2UU9BwcAcXuFe0to+hCeBMJl05Ixqig==
X-Received: by 2002:a05:651c:388:: with SMTP id
	e8mr4716081ljp.391.1627083639757; 
	Fri, 23 Jul 2021 16:40:39 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
	[209.85.208.180]) by smtp.gmail.com with ESMTPSA id
	t30sm2350609lfg.289.2021.07.23.16.40.38
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 23 Jul 2021 16:40:39 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id n6so3573591ljp.9
	for <cluster-devel@redhat.com>; Fri, 23 Jul 2021 16:40:38 -0700 (PDT)
X-Received: by 2002:a2e:90cd:: with SMTP id o13mr4693434ljg.465.1627083638619; 
	Fri, 23 Jul 2021 16:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-2-agruenba@redhat.com>
In-Reply-To: <20210723205840.299280-2-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Jul 2021 16:40:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg1n8yVeKABgfx7itM5o1jXVx6WXRF5PxHx+uqeFBmsmQ@mail.gmail.com>
Message-ID: <CAHk-=wg1n8yVeKABgfx7itM5o1jXVx6WXRF5PxHx+uqeFBmsmQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v3 1/7] iov_iter: Introduce
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

On Fri, Jul 23, 2021 at 1:58 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Introduce a new fault_in_iov_iter helper for manually faulting in an iterator.
> Other than fault_in_pages_writeable(), this function is non-destructive.

Again, as I pointed out in the previous version, "Other than" is not
sensible language.

You mean "Unlike".

Same issue in the comment:

> + * Other than fault_in_pages_writeable(), this function is non-destructive even
> + * when faulting in pages for writing.

It really should be

  "Unlike fault_in_pages_writeable(), this function .."

to parse correctly.

I understand what you mean, but only because I know what
fault_in_pages_writeable() does and what the issue was.

And in a year or two, I might have forgotten, and wonder what you meant.

             Linus

