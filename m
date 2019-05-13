Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BAE1BF89
	for <lists+cluster-devel@lfdr.de>; Tue, 14 May 2019 00:37:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60A438830B;
	Mon, 13 May 2019 22:37:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 039DC19C5A;
	Mon, 13 May 2019 22:37:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A73D18089CB;
	Mon, 13 May 2019 22:37:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DMbLiX024382 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 18:37:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CD845D71F; Mon, 13 May 2019 22:37:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66C245D71E
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 22:37:18 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C42AA811D8
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 22:37:18 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id f18so3806941otf.22
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 15:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y2PIg7PA7NbXYzQ6ceMERMEffFgZCmj4m+9Gzp4ac1s=;
	b=VfMdzp/Q5wMJ9pCU2RKSwOH5301ugl9jjMjcMxVYVw/w/rDaLhWrzLxtPakUJlqKSD
	r1YrZaJVFZ9Q3XwFiDGmZ/FUQ/1gDM0U8iLFJCG2RfJX2loWRyzyvMU3QoVObdcdQM2D
	QodpZAC3Apgs8C1IE2e2LKZVzsSV/o7wtrIrhR3c7jqlmbCagvx9MEZs2qzbcTG7rBFs
	jHkj6EChMYP/hRktIYR1j1d/LuqIFhbLkGYDtcdDocHP2uGtUfoge458W1aIWAiCeAlR
	8qxavA50DKCRkLu1k24yZwSsbY9wdbB8AOIi41Cmx+0lb1aRcUgxHMMuMODP9qFRYfTK
	Tc5Q==
X-Gm-Message-State: APjAAAWcXhcRkWTd5PYJnyBdqeYLyAc8OsVvogDc1ulzgq+gIokxYov5
	CfkL9DIrOZonrCKe7CLK7amx45ePIbBwdFbaAdDbuMLP42asI1QX8NwxKbcYbWMs9mgpRxo1KVM
	ITe3dGOilePnz4lqBvpIBYFOp4eUFh6381pOmVA==
X-Received: by 2002:aca:f086:: with SMTP id o128mr926825oih.101.1557787038152; 
	Mon, 13 May 2019 15:37:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5evQSu+Tg9JhDLJiwRCjCfq8rG1B3Pw6oRQUdSIZIqFNj8pim4lR3yk5sRjpmwRfnHXufEAPsWralDpgUneE=
X-Received: by 2002:aca:f086:: with SMTP id o128mr926818oih.101.1557787037890; 
	Mon, 13 May 2019 15:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190513195904.15726-1-agruenba@redhat.com>
	<CAHk-=wg=yz_=6oM1r5C4pWJPac8cD1kHiki73wDciuLLoRNY=w@mail.gmail.com>
In-Reply-To: <CAHk-=wg=yz_=6oM1r5C4pWJPac8cD1kHiki73wDciuLLoRNY=w@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 14 May 2019 00:37:06 +0200
Message-ID: <CAHc6FU43Fv_b9hMiRscs+cPbwLmcCBM-9R32fSsK9gUtMVMGUQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 13 May 2019 22:37:24 +0000 (UTC)

On Tue, 14 May 2019 at 00:27, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> Andreas,
>  did you intend for me to take this as a patch from the email, or will
> I get a pull request with this later?

Sorry, I should have been more explicit. Would you mind taking this
patch, please? If it's more convenient or more appropriate, I'll send
a pull request instead.

Thanks,
Andreas

