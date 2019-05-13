Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E40E1BF74
	for <lists+cluster-devel@lfdr.de>; Tue, 14 May 2019 00:27:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BF7E5D619;
	Mon, 13 May 2019 22:27:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11F9260856;
	Mon, 13 May 2019 22:27:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98DCD18089CA;
	Mon, 13 May 2019 22:27:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DMRjWL022956 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 18:27:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7138E9060; Mon, 13 May 2019 22:27:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B172601A0
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 22:27:43 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D8B5461CD
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 22:27:42 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id x132so10283433lfd.0
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 15:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bIXHe4yUSfdrp9HQnXwzm5xnUgCGBYJjN/aTrGgciFg=;
	b=UbvM3qdM2IYMhQLjreSGZnt/x+FCbuEvoJPPE25HbqSn+U7x5UFQUy77cpB6DQr1Uz
	DKpef6Cem2myIj++n9/vukZC+pEm3yvoHUBUDt+bvFkYQvT7uXA8o84+cij03Ii6Et3s
	w623zZmRc2qgAVQoOk3TkOel9hMgwXg0t/S+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bIXHe4yUSfdrp9HQnXwzm5xnUgCGBYJjN/aTrGgciFg=;
	b=fv5Bczr9oib5zBN1mvFO9mJEshN9nFTi1+bOMVRfeAhCFItIxiW/fR0iw+3kmWeTgJ
	YuKdHdXn7COQE/VL3pIW6iiX0bMPVXdIrphAHFALsTKWL7XnpEB6Jkw7ncUSqgE5TOsn
	4XXF2uALnM+Gw0gZjzxpIK9IUFcsbEXHZE0djuINwPKpNzWf5pFQ+sYk5pFSA8+NIeWo
	ZFDFTxgOUTS3mTbsKObEvEUCOWhtk+Ud4XSUsUwWykiYKLYZzszCr6cTv1agigjhPtro
	1l12zt+v7WjTqcvRYjEG1neb4nSOeiNqQXsFQycthelGhaLKGHR+hettfzLOhwUuBam4
	oOXA==
X-Gm-Message-State: APjAAAXznJ2eaYVLUzPGfFtNLZlO1en6l0UDj0aDjyCdY7eUIH2K1VND
	YSvc8lHbeb5CCXFkLSbeCFQqy73dzvY=
X-Google-Smtp-Source: APXvYqzoxc/9/OhVSc9kK+kwVyDW39S51iGyHdc5SkWVKVREYAczvUCP/kdWxvTjwVNv40m8lfsBvQ==
X-Received: by 2002:a19:4a04:: with SMTP id x4mr14447346lfa.124.1557786460389; 
	Mon, 13 May 2019 15:27:40 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
	[209.85.208.173]) by smtp.gmail.com with ESMTPSA id
	j27sm3332776lfk.97.2019.05.13.15.27.38 for <cluster-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 15:27:38 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id k8so12464435lja.8
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 15:27:38 -0700 (PDT)
X-Received: by 2002:a2e:1312:: with SMTP id 18mr4551964ljt.79.1557786458363;
	Mon, 13 May 2019 15:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190513195904.15726-1-agruenba@redhat.com>
In-Reply-To: <20190513195904.15726-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 May 2019 15:27:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=yz_=6oM1r5C4pWJPac8cD1kHiki73wDciuLLoRNY=w@mail.gmail.com>
Message-ID: <CAHk-=wg=yz_=6oM1r5C4pWJPac8cD1kHiki73wDciuLLoRNY=w@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 13 May 2019 22:27:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 13 May 2019 22:27:42 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 13 May 2019 22:27:52 +0000 (UTC)

Andreas,
 did you intend for me to take this as a patch from the email, or will
I get a pull request with this later?

             Linus

