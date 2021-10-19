Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE11B433AF3
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Oct 2021 17:44:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-jfCAUcwUP8WY4hkRb4aGOQ-1; Tue, 19 Oct 2021 11:44:20 -0400
X-MC-Unique: jfCAUcwUP8WY4hkRb4aGOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 211171808317;
	Tue, 19 Oct 2021 15:44:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E6D12C6ED;
	Tue, 19 Oct 2021 15:44:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 841111801241;
	Tue, 19 Oct 2021 15:44:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JFeYN1005453 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 11:40:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADBD740D1B9F; Tue, 19 Oct 2021 15:40:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA54A40C1257
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 15:40:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92E3A899EC4
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 15:40:34 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-ABKG31LYM0KUMzlUFTAXIw-1; Tue, 19 Oct 2021 11:40:32 -0400
X-MC-Unique: ABKG31LYM0KUMzlUFTAXIw-1
Received: by mail-lf1-f42.google.com with SMTP id u21so8410984lff.8
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 08:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M5qLpGOaG+oQiwUY6IZoloZawU2xGFjPWL0KZDD5Sqk=;
	b=3eztUOdlDFjzQcIiubt2UKW02hHXpvHTKIMibO7w3KUD3mW03hgiTo30sgMdwbf9jq
	gh9/VGEMHxXcX2lOfS+dHXqfXe62eitcm8fUoQlNR9Qwh0MyE4WBOlDGMkSrcZLeAH97
	j3SZ4veJ27B71eSrHueEx0lDdxt1pXrJXlb/9TmphkbdDmatEll1qRvmIFM9TC1cbn71
	cSVHJmkaWEuxUpe1laXv8q6MtsrLgGUuPW9IIOMqUe42Rx7+Kc9wYiK1SCHXk5VDFCfl
	jE9qCTzR6ngxbvWUB8IJGtahjFETA/dG5DKfXqbls8ZtHVmolbuhU3uXgVx+7En4v5tZ
	rzMA==
X-Gm-Message-State: AOAM530g0umCT1unqYdWCO7Q/FKBoE0w6sagoVZ5oO0ymiUrkHzsTWgQ
	IMH7/dqwy5VhsfoWCeAZ1cbSv2DUzb393g==
X-Google-Smtp-Source: ABdhPJwLtO2El8fjvsYIJNWVqN8SCUkizf9njHgpE853rHocKt7Xg7aDgCETPJa/Y9ER9AVCbh2GdA==
X-Received: by 2002:a05:6512:3ba4:: with SMTP id
	g36mr6783373lfv.111.1634658030509; 
	Tue, 19 Oct 2021 08:40:30 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
	[209.85.167.48]) by smtp.gmail.com with ESMTPSA id
	r128sm1686715lff.284.2021.10.19.08.40.29
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 Oct 2021 08:40:29 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id y26so8368535lfa.11
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 08:40:29 -0700 (PDT)
X-Received: by 2002:a05:6512:398a:: with SMTP id
	j10mr6559053lfu.402.1634658028835; 
	Tue, 19 Oct 2021 08:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211019134204.3382645-1-agruenba@redhat.com>
In-Reply-To: <20211019134204.3382645-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 19 Oct 2021 05:40:13 -1000
X-Gmail-Original-Message-ID: <CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
Message-ID: <CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 19, 2021 at 3:42 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> From my point of view, the following questions remain:
>
>  * I hope these patches will be merged for v5.16, but what process
>    should I follow for that?  The patch queue contains mm and iomap
>    changes, so a pull request from the gfs2 tree would be unusual.

Oh, I'd much rather get these as one pull request from the author and
from the person that actually ended up testing this.

It might be "unusual", but it's certainly not unheard of, and trying
to push different parts of the series through different maintainers
would just cause lots of extra churn.

Yes, normally I'd expect filesystem changes to have a diffstat that
clearly shows that "yes, it's all local to this filesystem", and when
I see anything else it raises red flags.

But it raises red flags not because it would be wrong to have changes
to other parts, but simply because when cross-subsystem development
happens, it needs to be discussed and cleared with people. And you've
done that.

So I'd take this as one pull request from you. You've been doing the
work, you get the questionable glory of being in charge of it all.
You'll get the blame too ;)

>  * Will Catalin Marinas's work for supporting arm64 sub-page faults
>    be queued behind these patches?  We have an overlap in
>    fault_in_[pages_]readable fault_in_[pages_]writeable, so one of
>    the two patch queues will need some adjustments.

I think that on the whole they should be developed separately, I don't
think it's going to be a particularly difficult conflict.

That whole discussion does mean that I suspect that we'll have to
change fault_in_iov_iter_writeable() to do the "every 16 bytes" or
whatever thing, and make it use an actual atomic "add zero" or
whatever rather than walk the page tables. But that's a conceptually
separate discussion from this one, I wouldn't actually want to mix up
the two issues too much.

Sure, they touch the same code, so there is _that_ overlap, but one is
about "the hardware rules are a-changing" and the other is about
filesystem use of - and expansion of - the things we do. Let's keep
them separate until ready, and then fix up the fallout at that point
(either as a merge resolution, or even partly after-the-fact).

                     Linus

