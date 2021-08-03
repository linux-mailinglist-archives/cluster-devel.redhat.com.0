Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 247133DF708
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Aug 2021 23:43:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628026985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EM3F3OHS2L2GE9YJO2LmAbAEq5eEZ/246ein95lIcos=;
	b=IzxEwmNZkIi9LuMJbL5rCC8xU9bMCCkrAZO74y2FcgJLoJhOubdFR0VYInDkYpyFJovora
	55RMfBtFdTd6K84lCSzF/s4PTV/7xdG3IIKVd2cF5GMuYW0HCQdpBu3xOWAhlouCL7ZmWZ
	muKmn6r1h2fCvJ53sHMing+wIdPdnEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-zkS3u5FrOvehQiloi5jejw-1; Tue, 03 Aug 2021 17:43:04 -0400
X-MC-Unique: zkS3u5FrOvehQiloi5jejw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50C58799EB;
	Tue,  3 Aug 2021 21:43:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EA3810372C0;
	Tue,  3 Aug 2021 21:43:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97F534BB7C;
	Tue,  3 Aug 2021 21:43:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 173LcctJ026930 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 17:38:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7EC62138BB7; Tue,  3 Aug 2021 21:38:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3C812138BB6
	for <cluster-devel@redhat.com>; Tue,  3 Aug 2021 21:38:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B6D2106668C
	for <cluster-devel@redhat.com>; Tue,  3 Aug 2021 21:38:26 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-586--ar9vm3AOJ6YoV-vMUf-iQ-1; Tue, 03 Aug 2021 17:38:25 -0400
X-MC-Unique: -ar9vm3AOJ6YoV-vMUf-iQ-1
Received: by mail-wm1-f72.google.com with SMTP id
	k13-20020a05600c1c8db029025018ac4f7dso164437wms.2
	for <cluster-devel@redhat.com>; Tue, 03 Aug 2021 14:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EM3F3OHS2L2GE9YJO2LmAbAEq5eEZ/246ein95lIcos=;
	b=B/DR2MztcsxGuVPRUlHU8bYS/9NpG0UInwmqnl8gY095bcYRPifqvAG6zytx96zkTW
	0y3azWRoJkbBiZTv4WM445cf0kM5WlpWtH8chnWM/SfgdRgPphn3zcH5xAXob4xdvwiZ
	iY2O4kxFNutCiSE7g7QwGzBlBcoLxiws74gBYnw4BEGwVt0NG8B6c7UPKSFCBq4+WwkC
	Ku+nVheJnXxKOr/604S3WJQ9wQyPu4HLq72u0GbK8KDV0RUd+P39OXgdWDoFwkbZHYVc
	ZrMPc4pJj9bKZPTfwUmiq46eCu05Z0cDs+hdDDbFlZNbpyHnduCJfgCrErAG1UMWm/Mi
	URPw==
X-Gm-Message-State: AOAM533nFnPlMOLIxpWcdHWNfAdy94lkNSzqBgo8p0+Kzc+b2igDID23
	EKntr+KoTA10iBIWXowVrA1FR/dxngkICUWd7fDF51Y04AZOr8+37eK58qc4mGJXOdmdOL+xq8x
	snTCo375PQ24L3xNh4U2PH8YtJdE+85p9/ItdVg==
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr24885004wrl.357.1628026704023;
	Tue, 03 Aug 2021 14:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZzs1zl2V3LTsadj+4bR4O6BnVBDX/GlTJnBJVWvnotmNbJsR03yyQqgOjRCTvd6UqzZnYP7e1CCrvtQ8KSCA=
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr24884995wrl.357.1628026703875;
	Tue, 03 Aug 2021 14:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
	<20210803191818.993968-4-agruenba@redhat.com>
	<YQmtnuqDwBIBf4N+@zeniv-ca.linux.org.uk>
In-Reply-To: <YQmtnuqDwBIBf4N+@zeniv-ca.linux.org.uk>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 3 Aug 2021 23:38:12 +0200
Message-ID: <CAHc6FU7iAPOPO7gtDjpSAVyHwgJ7HQPEhDC_2T__DM8GPW5crQ@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v5 03/12] Turn fault_in_pages_{readable,
	writeable} into fault_in_{readable, writeable}
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

On Tue, Aug 3, 2021 at 10:57 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Tue, Aug 03, 2021 at 09:18:09PM +0200, Andreas Gruenbacher wrote:
> > Turn fault_in_pages_{readable,writeable} into versions that return the number
> > of bytes faulted in instead of returning a non-zero value when any of the
> > requested pages couldn't be faulted in.  This supports the existing users that
> > require all pages to be faulted in, but also new users that are happy if any
> > pages can be faulted in.
> >
> > Neither of these functions is entirely trivial and it doesn't seem useful to
> > inline them, so move them to mm/gup.c.
> >
> > Rename the functions to fault_in_{readable,writeable} to make sure that code
> > that uses them can be fixed instead of breaking silently.
>
> Sigh...  We'd already discussed that; it's bloody pointless.  Making short
> fault-in return success - absolutely.  Reporting exact number of bytes is
> not going to be of any use to callers.

I'm not actually convinced that you're right about this. Let's see
what we'll end up with; we can always strip things down in the end.

Thanks,
Andreas

