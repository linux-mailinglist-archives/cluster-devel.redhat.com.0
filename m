Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9C6110672
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Dec 2019 22:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575408099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/2Pn+nUwTPiWQNmD6ZcUyBL9YYHx/8hYVUPPzlyrC1w=;
	b=Mj0nomeQd2fDAHAFHyAR30cPoBwjBsKxYbIHzNltE6jDsa88PkkuOQiglJ/6gsc8jk/qdn
	rQSXyAp26FrhteITwioRffn0viYcoGoqzi2dc3wZUmqog+fRRx//jk5vzg6u0g7Y3TNm7j
	Rt/P3ZTUDpjaRp7P0CkEvq4c7uEcaB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-6KJdL-IFMrCtNSLSklou-g-1; Tue, 03 Dec 2019 16:21:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0881C801E70;
	Tue,  3 Dec 2019 21:21:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8855F1001B03;
	Tue,  3 Dec 2019 21:21:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DC4F18034EA;
	Tue,  3 Dec 2019 21:21:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3LLR1r017626 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 16:21:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 53ECC215AB0A; Tue,  3 Dec 2019 21:21:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F260215AB04
	for <cluster-devel@redhat.com>; Tue,  3 Dec 2019 21:21:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBB99101A55D
	for <cluster-devel@redhat.com>; Tue,  3 Dec 2019 21:21:24 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-51-3VXTfj10PmaANRDMDfbxnA-1; Tue, 03 Dec 2019 16:21:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id e28so5478606ljo.9
	for <cluster-devel@redhat.com>; Tue, 03 Dec 2019 13:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/2Pn+nUwTPiWQNmD6ZcUyBL9YYHx/8hYVUPPzlyrC1w=;
	b=JfiXSfzJlPBoY/zw0XV0w4mjWmOBoLV79NOWGwvJw9F1EtjC2PLG47+NWCbDasyIlG
	95pChbL+mOX2UKCHDMkvrPXumW56ysbn8CZwvctY1/ptKZwe8DehiZY0QoKQd+YM4CBy
	fvGwySEGyDhmRLPlmlbUdDlun9gqGwl0xdOUz19v2R+X6L3m1LB6JlaDMnZm0sb6JyVT
	yf5e35CyCjXWXx5U1bWQbLfFF15r5Rp9H81zIFJVlaHOeF3DCs2F1YVG6UQzRsZ+OC14
	VOgNvVOaZCkM2rp+I05S5iaCchbMpA3Bt7V4Bdca5GsjCQy2QaOzqyuG751ENCfrZtOc
	ZfWA==
X-Gm-Message-State: APjAAAWw5phJKi/+0P4nSezD+W6HyJw2pt6T3BglI/pPYUBhj+6Xi6Py
	cDdpBOoximEgk6ws4GFJpxqugR6rFmo=
X-Google-Smtp-Source: APXvYqxKGzfFfXMB1/MOaB6aQzZXuXyMSRCV2uEEQLuWBCWP1s+MEPgdPR4D42DPstHlv6bqipufXw==
X-Received: by 2002:a2e:93d5:: with SMTP id p21mr4005675ljh.50.1575408078962; 
	Tue, 03 Dec 2019 13:21:18 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
	[209.85.208.181]) by smtp.gmail.com with ESMTPSA id
	h19sm1932296ljl.57.2019.12.03.13.21.17 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Dec 2019 13:21:18 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id c19so5448417lji.11
	for <cluster-devel@redhat.com>; Tue, 03 Dec 2019 13:21:17 -0800 (PST)
X-Received: by 2002:a2e:63dd:: with SMTP id s90mr3908645lje.48.1575408077519; 
	Tue, 03 Dec 2019 13:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20191203160856.GC7323@magnolia>
In-Reply-To: <20191203160856.GC7323@magnolia>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Dec 2019 13:21:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh3vin7WyMpBGWxZovGp51wa=U0T=TXqnQPVMBiEpdvsQ@mail.gmail.com>
Message-ID: <CAHk-=wh3vin7WyMpBGWxZovGp51wa=U0T=TXqnQPVMBiEpdvsQ@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-MC-Unique: 3VXTfj10PmaANRDMDfbxnA-1
X-MC-Unique: 6KJdL-IFMrCtNSLSklou-g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB3LLR1r017626
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Dave Chinner <david@fromorbit.com>, Eric Sandeen <sandeen@sandeen.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [GIT PULL] iomap: small cleanups for 5.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2019 at 8:09 AM Darrick J. Wong <djwong@kernel.org> wrote:
> Please pull this series containing some more new iomap code for 5.5.
> There's not much this time -- just removing some local variables that
> don't need to exist in the iomap directio code.

Hmm. The tag message (which was also in the email thanks to git
request-pull) is very misleading.

Pulled, but please check these things.

           Linus


