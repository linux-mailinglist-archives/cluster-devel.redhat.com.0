Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54357439EE4
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Oct 2021 21:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635188545;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QkyoC/NexH1Nu0O2R4wJhF/62iz6WrFzKuF9woFeRsA=;
	b=F17uG1npZxwDMmD1ZCS4v+OuB/5Hyk1zrc45Buy8lmY7iqq9sR6IdZWDyTbAOrqaYBuThM
	B1XHdUytykLik8sEgO2rlUEQcwMcR4YB/pFbInlTjSA0yjuXXBSayCsAImQqlgt+HSIcLG
	v80RhHKfUOBledBhNXzzLVnBXT09Apw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-XIE4O9NwN2uq0slAb6S4Lg-1; Mon, 25 Oct 2021 15:02:22 -0400
X-MC-Unique: XIE4O9NwN2uq0slAb6S4Lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF8D3801B01;
	Mon, 25 Oct 2021 19:02:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B881A61093;
	Mon, 25 Oct 2021 19:02:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0765F1801241;
	Mon, 25 Oct 2021 19:01:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19PJ11CV032230 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 25 Oct 2021 15:01:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 934C851DD; Mon, 25 Oct 2021 19:01:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CCB051DC
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 19:00:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A335C899ECD
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 19:00:58 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-603-XL9rYNVlNz2ema8HlQM-Tg-1; Mon, 25 Oct 2021 15:00:57 -0400
X-MC-Unique: XL9rYNVlNz2ema8HlQM-Tg-1
Received: by mail-wm1-f70.google.com with SMTP id
	v18-20020a7bcb52000000b00322fea1d5b7so352962wmj.9
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 12:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QkyoC/NexH1Nu0O2R4wJhF/62iz6WrFzKuF9woFeRsA=;
	b=spo/hGmm8/0toKluAKnSvTlbyx5MK1CjRNam2DvAUT6eK6qgDoBM/IItO4pwqGy8Ed
	u5tL81mpA8vwr6BOIk4i5RIMhs01NI6+1LwP35ftXoxQd7tQOTEyms02RbJiIEEzSDTy
	Qi3V35XYO4P7fdhJVpOFwUGkK5QNar0JB+Y0Ma0Q4UBTPj7zhzWsQKm11yzP7i0kOhuv
	rFVx16cS7ld92WpwkvvCYy0AjDwGrfrTywsncfpfSG9JH121J4onMboeO98Y0OSgifRw
	55BtCRTC6ZwbX4U9J9ST2QaiMNrRSev5WHeV/jJzSJ/SVem9C6R1f+cTNXprTFkIVg53
	qAwQ==
X-Gm-Message-State: AOAM532+RW/3GRyq2x2as1wvS5vwW3HQCO+MuK1gyJeWPHOWz4eWDeHZ
	W53KFbTcm7OVaMsjPpRZ2ZqEjfZGvOr3+hppu0J7QE0I7ssEnAIwDc/YM8Bwcw5y50RVkYjpJQh
	d6s9AAI5/7GYhF5+fcwHMzabLnkkvrGEpT5Ogtg==
X-Received: by 2002:a7b:c74f:: with SMTP id w15mr21890321wmk.186.1635188455455;
	Mon, 25 Oct 2021 12:00:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzXLWqbHTas2L+Ep0jJ8Ym3FrcHaKtpcTPgh7nV35XP5aJDxyjNlJ4UaNmG9hWfJd1eun8dCJKnnE+XiZ6mmk=
X-Received: by 2002:a7b:c74f:: with SMTP id w15mr21890297wmk.186.1635188455236;
	Mon, 25 Oct 2021 12:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
In-Reply-To: <CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 25 Oct 2021 21:00:43 +0200
Message-ID: <CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
	deadlocks
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

On Fri, Oct 22, 2021 at 9:23 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Oct 22, 2021 at 8:06 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > Probing only the first byte(s) in fault_in() would be ideal, no need to
> > go through all filesystems and try to change the uaccess/probing order.
>
> Let's try that. Or rather: probing just the first page - since there
> are users like that btrfs ioctl, and the direct-io path.

For direct I/O, we actually only want to trigger page fault-in so that
we can grab page references with bio_iov_iter_get_pages. Probing for
sub-page error domains will only slow things down. If we hit -EFAULT
during the actual copy-in or copy-out, we know that the error can't be
page fault related. Similarly, in the buffered I/O case, we only
really care about the next byte, so any probing beyond that is
unnecessary.

So maybe we should split the sub-page error domain probing off from
the fault-in functions. Or at least add an argument to the fault-in
functions that specifies the amount of memory to probe.

Thanks,
Andreas

