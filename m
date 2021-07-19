Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DFE843CEB58
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 21:31:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-z7YC2C3dOtSrGbSSGmEnSg-1; Mon, 19 Jul 2021 15:31:33 -0400
X-MC-Unique: z7YC2C3dOtSrGbSSGmEnSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD76210168C0;
	Mon, 19 Jul 2021 19:31:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBD085E275;
	Mon, 19 Jul 2021 19:31:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94B944EA29;
	Mon, 19 Jul 2021 19:31:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JJVTZA016081 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 15:31:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9059200D8F3; Mon, 19 Jul 2021 19:31:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E287320296AF
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 19:31:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0F9618A01A5
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 19:31:25 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-y1YAr4h2MaWUEr2LpqgQ2Q-1; Mon, 19 Jul 2021 15:31:23 -0400
X-MC-Unique: y1YAr4h2MaWUEr2LpqgQ2Q-1
Received: by mail-lj1-f178.google.com with SMTP id e14so9451616ljo.7
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 12:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JRKNjK3HDiyg7MZUU6xzfGsB6oi9LOaFsq3T/zTDatI=;
	b=pXx2rQnaFWoVKzRPFyf0F8keAW1Pa+1Vq5l7KfTNMPCbfpIBwiZJy1escIUr4VD65T
	0HLfXSvLpbHZtHSpG6Q0JpFxR6ujOO7E2K52KeaX3oQ0vtbzen3LpkHepyrDy4ZLyXHs
	OPn1Yjlb1teQDSnGvsHustZIYSErf9P6CpPScQMfIZKDMuilI9oTWnQR2TC8vx92loho
	6E+VNh5ggfByRDKkhXvc2X2kHby6YATCeJKIDxOKRxKu74JJtOJGYyaHs5Foa1IcwfA6
	F8ZtSYwMrrffw2kBBBn41OtYw5Vy+rX2JiwqKrhtnd0dm0MiaoK72vE4rb62pmeAxf+7
	7J+g==
X-Gm-Message-State: AOAM531s2yPmnr5UNtc3CkITXmNXe1yJ6uBVFtSfe+7Hi4q8Ung4/5l7
	gACcmKniiC+g3USU9fC9Fw3mFDUXiRqDy2l9
X-Google-Smtp-Source: ABdhPJwLLjCrqBdX2jgaYRqfKzDgWlRdVmWMV3y3G/razNo1oh9Mp3ysPkxwr6pr+MXQfZ3KlUkG2w==
X-Received: by 2002:a2e:8547:: with SMTP id u7mr364177ljj.26.1626723081851;
	Mon, 19 Jul 2021 12:31:21 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
	[209.85.167.52])
	by smtp.gmail.com with ESMTPSA id j26sm715666lfh.71.2021.07.19.12.31.20
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 19 Jul 2021 12:31:20 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id a12so32072025lfb.7
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 12:31:20 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id
	x2mr18099945lfa.421.1626723079907; 
	Mon, 19 Jul 2021 12:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210718223932.2703330-1-agruenba@redhat.com>
In-Reply-To: <20210718223932.2703330-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Jul 2021 12:31:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjBKeA=obJOc5VRP38=ffm2dCfVmKmy5PLAgs3rysoEtw@mail.gmail.com>
Message-ID: <CAHk-=wjBKeA=obJOc5VRP38=ffm2dCfVmKmy5PLAgs3rysoEtw@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v2 0/6] gfs2: Fix mmap + page fault
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 18, 2021 at 3:39 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> here's an update to the gfs2 mmap + page faults fix that implements
> Linus's suggestion of disabling page faults while we're holding the
> inode glock.

Apart from some wording/naming issues, I think this looks a _lot_
better, and should fix the fundamental and underlying deadlock
properly.

So Ack from me with the trivial suggestions I sent to the individual patches.

            Linus

