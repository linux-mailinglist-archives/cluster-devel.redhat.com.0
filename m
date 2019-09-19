Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B600CB7F94
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Sep 2019 19:05:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5821310DCC97;
	Thu, 19 Sep 2019 17:05:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B955D9E5;
	Thu, 19 Sep 2019 17:05:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA6121808876;
	Thu, 19 Sep 2019 17:05:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8JH57ep003934 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Sep 2019 13:05:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C6725C1B5; Thu, 19 Sep 2019 17:05:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 844215C22F
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 17:05:04 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52D1410F2E86
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 17:05:03 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 72so2917872lfh.6
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cG/q3cFRYsyXfs7WGIDIqxPhNH59Y8kVxp4a4QrtYec=;
	b=E2cDdbP2/fhgtUxeWn9F/GPtmg03tInrSSBmBjgzSx2QzM61s/GaEXUloJz81ijobL
	PDNb7lDrr/uWOWaQGMcZ/bzgSkg2A+IktHmv0xZxrybAdkgVOGCSAErBYug47C0mIo+0
	3rMkP4xNaakXDWOWhasJcY2phrxijQ6+lzNPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cG/q3cFRYsyXfs7WGIDIqxPhNH59Y8kVxp4a4QrtYec=;
	b=tTsr0Gx2UOG+UZLxyvJdib8o3S6L5rZdL4kcpDkIOMcfW8O8d8PkcaMx1j2Vaww5BW
	cRLNwbUWJEK0mPsRFlgHAmpkYLkLeNODVdyxRNk9hwjcbTVa6dWWM1wmLxXZeXYPXO5t
	Cjm+6kxvPgoF/buNNZnMl7qfkpg/GBu1EjRHvvanxB+xiH1wnH3j0eWnXN0EJYRA/+64
	DmQ24LJNb2l1Qitchry+HhpNPfkHC9RDJkzs0v5j5rBmBihpPmKB8cgFbemv4ZS8gi8f
	c+PHgzbKQZ0nmfReugNmbOtkA5nyzjAbqofsvbo3sWEUCibdvluc3+Ze+xvty9gLnI9Z
	TzKw==
X-Gm-Message-State: APjAAAU5MNM/6qzg0sz4KAQoOw5jk7sSuzVXmTFjszhc6qoeLgyby+6q
	TRfP9ILGZcDpeY7mkLBiSGLfVzjw830=
X-Google-Smtp-Source: APXvYqwifRSZOqhv6D7gFaUlrJQLbc+ftslZciahzrvenSIaBcoHQBEAwebsGUfIRhiqavPokydBWA==
X-Received: by 2002:ac2:5dd6:: with SMTP id x22mr5454585lfq.71.1568912701398; 
	Thu, 19 Sep 2019 10:05:01 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54])
	by smtp.gmail.com with ESMTPSA id m17sm2057055lje.0.2019.09.19.10.05.00
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Sep 2019 10:05:00 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id c195so2901522lfg.9
	for <cluster-devel@redhat.com>; Thu, 19 Sep 2019 10:05:00 -0700 (PDT)
X-Received: by 2002:ac2:47f8:: with SMTP id b24mr5615990lfp.134.1568912700141; 
	Thu, 19 Sep 2019 10:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190917152140.GU2229799@magnolia>
	<CAHk-=wj9Zjb=NENJ6SViNiYiYi4LFX9WYqskZh4E_OzjijK1VA@mail.gmail.com>
	<20190919034502.GJ2229799@magnolia>
	<CAHk-=wgFRM=z6WS-QLThxL2T1AaoCQeZSoHzj8ak35uSePQVbA@mail.gmail.com>
In-Reply-To: <CAHk-=wgFRM=z6WS-QLThxL2T1AaoCQeZSoHzj8ak35uSePQVbA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2019 10:04:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjS25dNe=zj8s8w0ppGoL33JQczQWdF406ubnkJHQ9izg@mail.gmail.com>
Message-ID: <CAHk-=wjS25dNe=zj8s8w0ppGoL33JQczQWdF406ubnkJHQ9izg@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Thu, 19 Sep 2019 17:05:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Thu, 19 Sep 2019 17:05:03 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: 0.148  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Dave Chinner <david@fromorbit.com>, "Darrick J. Wong" <djwong@kernel.org>,
	Eric Sandeen <sandeen@sandeen.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Thu, 19 Sep 2019 17:05:10 +0000 (UTC)

On Thu, Sep 19, 2019 at 10:03 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So inside of xfs, that "pop ioend from the list" model really may make
> perfect sense, and you could just do
>
>     static inline struct xfs_ioend *xfs_pop_ioend(struct list_head *head)

Note that as usual, my code in emails is written in the MUA, entirely
untested, and may be completely broken.

So take it just as a "maybe something like this works for you".

             Linus

