Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F821BF9D
	for <lists+cluster-devel@lfdr.de>; Tue, 14 May 2019 00:47:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF649308FC22;
	Mon, 13 May 2019 22:47:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5804063BA9;
	Mon, 13 May 2019 22:47:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63D9741F58;
	Mon, 13 May 2019 22:47:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DMljfN025809 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 18:47:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C91E918ED7; Mon, 13 May 2019 22:47:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C479918E3F
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 22:47:43 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57503308A963
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 22:47:42 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y10so10302591lfl.3
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NOjzR5gzdUf/7ChCYCZCTq7x6PiCIoqFFNcqS/TXVfY=;
	b=d/8OvGpKdy+Qzy6ImDfcGAuOZ997gQDh3TiXd97ZsIN2Ic67JkkXPFCPp406jfL4DR
	jDG0hEpEBHVWWfdt6En4IlsM2wEN/2HdVDkCBDwD26a7Sv7D0LOw/8VfEnqTyjPEtGoU
	EgLnDyJ7bnP+aEK9X2wKbf+082qeT2KWlO3d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NOjzR5gzdUf/7ChCYCZCTq7x6PiCIoqFFNcqS/TXVfY=;
	b=GV2t/b7ejiVXQ/C/upvajs5X2+ECmNHRYW603Y5sj2k/PzPZM29vpi5FwPtgpgdVNi
	ttW0kX7nXifw1iNW7rmSt4+1eYu8BxycS8RGSzdjaIK40u+4I/ZPs6ptaQPuxvA7z/Mq
	RtzVblsDPY4+4qGMMDQhTWSFDXFrz/5V3BL8YlqBzm54vKSNyLCT3+u24PWLYs2pEMvK
	I7CkpEE2o5JrPSv9H/IKk3R8aiG2UNjFvcNxPJhzfbGFtl6pxGONypNiywh+f3QnKbBh
	vKhFtW2Nn9qAyRKM/TWGfBM+PuBkvtTFfWYds7GgFAZ0HCyy3MNlxFVrBn0J49iMPkdx
	pJWA==
X-Gm-Message-State: APjAAAUvSBEnXv0/f0Fy4proEuREI1PoySmeESJXEMxS/vKOlOXcxhE2
	gKwR0cRwlAr0pM3hyh4XCY5MC6DJP3c=
X-Google-Smtp-Source: APXvYqzEcTFNlDfHZsRMbq6hHMB1YfWsgIsjLo0AN4sj6FFl/Vh48ldK5Pn8zgjlDjxPyohESRmKVQ==
X-Received: by 2002:a19:f80d:: with SMTP id a13mr942442lff.78.1557787660412;
	Mon, 13 May 2019 15:47:40 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
	[209.85.167.49])
	by smtp.gmail.com with ESMTPSA id u7sm1367413ljj.51.2019.05.13.15.47.39
	for <cluster-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 15:47:39 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id y13so470193lfh.9
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 15:47:39 -0700 (PDT)
X-Received: by 2002:a19:5015:: with SMTP id e21mr15292317lfb.62.1557787659075; 
	Mon, 13 May 2019 15:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190513195904.15726-1-agruenba@redhat.com>
	<CAHk-=wg=yz_=6oM1r5C4pWJPac8cD1kHiki73wDciuLLoRNY=w@mail.gmail.com>
	<CAHc6FU43Fv_b9hMiRscs+cPbwLmcCBM-9R32fSsK9gUtMVMGUQ@mail.gmail.com>
In-Reply-To: <CAHc6FU43Fv_b9hMiRscs+cPbwLmcCBM-9R32fSsK9gUtMVMGUQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 May 2019 15:47:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipiSQ=+dTssFhjYXUS0VgJYRNqy8s_YNTL8HbZ6iKsYg@mail.gmail.com>
Message-ID: <CAHk-=wipiSQ=+dTssFhjYXUS0VgJYRNqy8s_YNTL8HbZ6iKsYg@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 13 May 2019 22:47:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 13 May 2019 22:47:42 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
	"Tobin C. Harding" <tobin@kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix error path kobject memory leak
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 13 May 2019 22:47:55 +0000 (UTC)

On Mon, May 13, 2019 at 3:37 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Sorry, I should have been more explicit. Would you mind taking this
> patch, please? If it's more convenient or more appropriate, I'll send
> a pull request instead.

Done.

However,I'd like to point out that when I see patches from people who
I normally get a pull request from, I usually ignore them.

Particularly when they are in some thread with discussion, I'll often
just assume that  th epatch is part of the thread, not really meant
for me in particular.

In this case I happened to notice that suddenly my participation
status changed, which is why I asked, but in general I might hav ejust
archived the thread with the assumption that I'll be getting the patch
later as a git pull.

Just so you'll be aware of this in the future, in case I don't react...

               Linus

