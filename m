Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E5079B8029
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Sep 2019 19:42:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AC833022465;
	Thu, 19 Sep 2019 17:42:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A5060C80;
	Thu, 19 Sep 2019 17:42:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A6A64EE96;
	Thu, 19 Sep 2019 17:42:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8JHfwa3007566 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Sep 2019 13:41:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 777CA60167; Thu, 19 Sep 2019 17:41:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 712456013A
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 17:41:56 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62F1418C8900
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 17:41:55 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l21so4484322lje.4
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FiZz07Z/205AAVNujcqJzuj2VRlA1gVyITjZ2X3S9P0=;
	b=LUgHYlFO2ivHWXkjIMWHXKro3f62RmlbsjtZDM3aN1lBnbF/0enyMjBYRqw1bvQU+o
	WjuX6sn56vnQRYqFCSVxl5+izbPmn5JthFgQ1CVdOhSEm0KaDtohrjU8sSopQtoAQ4n6
	i+xMWyf0WARK8PenV7l026IzYlve6DXyQGV3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FiZz07Z/205AAVNujcqJzuj2VRlA1gVyITjZ2X3S9P0=;
	b=HpbQspSQrP1/+mNw0WIy7/rST7n4lDDvsf+KRBiqXsb+2+oBkAjjLK1UwhbzTCI6Qj
	PkaxMZuYxpHFcxKg9WI/HoSvOSuroNhsg6xx/c09xdNe8DWJ5xpC3ryIWpPG2ofBE+5B
	QsXQnYaly7BEVnThRUyDJbSxF6oxkziLnVdYTD2AJhCOqTA4uyXPFLtXEAvbDBUnqPnO
	Aa3S2Cc5MDp7yHbHicC6KQOg0zBLF55OnWrZo7F4dZYUHSPER50aj4KDi0C47xiV3kMm
	SJ0mLNGwST8IeXM6Ec4MgmXoOaMKTQcXD0nLl1GuIxFhWTOZ6S28nuGvVeBEks80C+WW
	L2dw==
X-Gm-Message-State: APjAAAW9w25PHn+RqSgSmD2Y0NZZSw0T/RiHyY6VOFPJUK/tLOG+uDdD
	IxCb0TC0qC1DlB/hzVQPgZvFC3Ppr+w=
X-Google-Smtp-Source: APXvYqzO5Xqd/Iu6RjCeqrVrxPdVYTkwkTa3lW5jOD8aUi1pCn/UjJxIu7vC76r/nSoq6/SAGITDuQ==
X-Received: by 2002:a2e:3806:: with SMTP id f6mr6199411lja.143.1568914913657; 
	Thu, 19 Sep 2019 10:41:53 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
	[209.85.167.47]) by smtp.gmail.com with ESMTPSA id
	m21sm1704726lfh.39.2019.09.19.10.41.50 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Sep 2019 10:41:50 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id w6so3011692lfl.2
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 10:41:50 -0700 (PDT)
X-Received: by 2002:ac2:50cb:: with SMTP id h11mr5665094lfm.170.1568914909864; 
	Thu, 19 Sep 2019 10:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190917152140.GU2229799@magnolia>
	<CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
	<20190919034502.GJ2229799@magnolia>
	<CAHk-=wgFRM=z6WS-QLThxL2T1AaoCQeZSoHzj8ak35uSePQVbA@mail.gmail.com>
	<20190919170711.GA9065@lst.de>
In-Reply-To: <20190919170711.GA9065@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2019 10:41:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgK7+TtDRbSAmcM5ihBDxF4eCg7zAXDkrNm7DOg+RtzyA@mail.gmail.com>
Message-ID: <CAHk-=wgK7+TtDRbSAmcM5ihBDxF4eCg7zAXDkrNm7DOg+RtzyA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Thu, 19 Sep 2019 17:41:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Thu, 19 Sep 2019 17:41:55 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com' HELO:'mail-lj1-f193.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: 0.148  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8JHfwa3007566
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Eric Sandeen <sandeen@sandeen.net>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [Cluster-devel] [GIT PULL] iomap: new code for 5.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 19 Sep 2019 17:42:03 +0000 (UTC)

On Thu, Sep 19, 2019 at 10:07 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I personally surived with it, but really hated writing the open coded
> list_for_each_entry + list_del or while list_first_entry_or_null +
> ┐ist_del when I could have a nice primitive for it.  I finally decided
> to just add that helper..

You realize that the list helper is even mis-named?

Generally a "pop()" should pop the last entry, not the first one. Or
course, which one is last and which one is first is entirely up to you
since you can add at the tail or the beginning. So even the name is
ambiguous.

So I really think the whole thing was badly implemented (and yes, part
of that was the whole implementation thing).

Doing list_del() by hand also means that you can actually decide if
you want list_del_init() or not. So it's

But again - keep that helper if you want it. Just don't put a badly
implemented and badly named "helper" it in a global header file that
_everybody_ has to look at.

                   Linus

