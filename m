Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8A43D430
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Oct 2021 23:19:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-ry5tD7wlNrSKZedFks5RAQ-1; Wed, 27 Oct 2021 17:19:03 -0400
X-MC-Unique: ry5tD7wlNrSKZedFks5RAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C22806688;
	Wed, 27 Oct 2021 21:19:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7BA619EF9;
	Wed, 27 Oct 2021 21:18:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81E914E58F;
	Wed, 27 Oct 2021 21:18:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RLFDt9005829 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 17:15:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0997351E2; Wed, 27 Oct 2021 21:15:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0485A51E1
	for <cluster-devel@redhat.com>; Wed, 27 Oct 2021 21:15:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16AEA800141
	for <cluster-devel@redhat.com>; Wed, 27 Oct 2021 21:15:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-551-VR0xAzHLMJG13Aw7rQD08A-1; Wed, 27 Oct 2021 17:15:07 -0400
X-MC-Unique: VR0xAzHLMJG13Aw7rQD08A-1
Received: by mail-lf1-f48.google.com with SMTP id u21so8942513lff.8
	for <cluster-devel@redhat.com>; Wed, 27 Oct 2021 14:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hiXmABk2yLJcTBwV/OV64LUSAMHnd37fHZz79FC6JvU=;
	b=FNxTsAGrt8BiIhgLa7/IljZlBs36UqGuVgH8UyHN1QakfueizHDF0HOEJ3tA17INht
	7Akv47aGGbUrp2f6brPpB0dpC5di+D8RxcthPytjbLrGKgRmyQyWRcm5ULxMd7DUQw17
	0i7uzEqsdfwLQf91AAaBTtn647APDiuTMwy5SEd6lCTcrDRLHpTo7HW8o8RZkkpF9uam
	r64d41Q3SEZXD9F848+Lgu2I4h9V4mq/5tBcvd9T+uPYVgqEcNwJqf4QKf+t1hFmH5o8
	G7eoU7P2KHhPnUQWCQ66w0n4/BpTOYcU/zvhc2suxfbhLlbyop4RNxyMekC/bgzx1+oP
	dgQQ==
X-Gm-Message-State: AOAM531gxW9/Mzfh6Mkyjn1ClmxvlXwRrw9zZ1IBKDywLeZ134mYildR
	LLkNEqKbqAHcGrzwC1zNgfjURkqoCcLJC9yv
X-Google-Smtp-Source: ABdhPJyCnK99QAd/91j7/Aau+L5uWWccebyMGNhT4Nwgh0xEBGdYkb5YtjqEdjMzRdTlfqZRRP88vg==
X-Received: by 2002:a05:6512:1152:: with SMTP id
	m18mr93726lfg.117.1635369305779; 
	Wed, 27 Oct 2021 14:15:05 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
	[209.85.167.42])
	by smtp.gmail.com with ESMTPSA id o2sm113946lfq.260.2021.10.27.14.15.04
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 27 Oct 2021 14:15:04 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id u11so9026188lfs.1
	for <cluster-devel@redhat.com>; Wed, 27 Oct 2021 14:15:04 -0700 (PDT)
X-Received: by 2002:a19:f619:: with SMTP id x25mr90493lfe.141.1635369304547;
	Wed, 27 Oct 2021 14:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
	<CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
	<YXhH0sBSyTyz5Eh2@arm.com>
	<CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
	<YXmkvfL9B+4mQAIo@arm.com>
In-Reply-To: <YXmkvfL9B+4mQAIo@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Oct 2021 14:14:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjQqi9cw1Guz6a8oBB0xiQNF_jtFzs3gW0k7+fKN-mB1g@mail.gmail.com>
Message-ID: <CAHk-=wjQqi9cw1Guz6a8oBB0xiQNF_jtFzs3gW0k7+fKN-mB1g@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 12:13 PM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> As an alternative, you mentioned earlier that a per-thread fault status
> was not feasible on x86 due to races. Was this only for the hw poison
> case? I think the uaccess is slightly different.

It's not x86-specific, it's very generic.

If we set some flag in the per-thread status, we'll need to be careful
about not overwriting it if we then have a subsequent NMI that _also_
takes a (completely unrelated) page fault - before we then read the
per-thread flag.

Think 'perf' and fetching backtraces etc.

Note that the NMI page fault can easily also be a pointer coloring
fault on arm64, for exactly the same reason that whatever original
copy_from_user() code was. So this is not a "oh, pointer coloring
faults are different". They have the same re-entrancy issue.

And both the "pagefault_disable" and "fault happens in interrupt
context" cases are also the exact same 'faulthandler_disabled()'
thing. So even at fault time they look very similar.

So we'd have to have some way to separate out only the one we care about.

               Linus

