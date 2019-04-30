Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0160DFDA2
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 18:16:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26BD1309264B;
	Tue, 30 Apr 2019 16:16:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02BB819749;
	Tue, 30 Apr 2019 16:16:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A31918089CC;
	Tue, 30 Apr 2019 16:16:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UGGG5Y004600 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 12:16:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDEEC7C82B; Tue, 30 Apr 2019 16:16:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EAF07D92E;
	Tue, 30 Apr 2019 16:16:11 +0000 (UTC)
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15D5C309E96F;
	Tue, 30 Apr 2019 16:16:11 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id q14so5624409itk.0;
	Tue, 30 Apr 2019 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+7vha2sHMjrOUYPXWIWZ5r9+BQnrS0i2CpGkGubXy9c=;
	b=ZEvdr6d2+xG0yFqb8iyxrYut8QGgl1yzTRo7Ow5Vhy3IMx37a+DFMc0lnlKsNqOEyh
	QfEnblICo9oXNPzKDKbn1EkJaP/hdE7bbewTFezSBWSNvQwty7TvYsr12iOw2YYBVCuP
	la57aMu8L/5bKdx24NXSPUU/kI7ud0lQqKualXqmGSg63pBdzObacOlkHEqsOZjBpiay
	QQtckT0qJ7Wqvq/aN+CZBi02U6Jco2A7k7V2nDIU7ex0Ne5FJPYzSB8yLdKO1NaYpIbs
	ilkZSqXC+az16c77RXYrGtRfMLMrzpM/XzBDXOihzs+S7WLlPflrS70Jay48fo2t/T4/
	7DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+7vha2sHMjrOUYPXWIWZ5r9+BQnrS0i2CpGkGubXy9c=;
	b=PskWqK/Zc1kkFjyTPHihftJpWS5WQtiVk7ltXvXslO/h/+vyVZEB9nr6oMmXCRwzFI
	WwOCvC7Z6INz6MFySaO2SrLGJp98ZweoUZotfeOfGmN+nKTsnD68YoCaLGtXdJGB7gxQ
	QFqrWkHgIpqRESq28dA/HjMlSeXkQoxxGes2b6Iv9mi4F+V9YBk1Tkv67OryvEe+PqXg
	xaWj+8aS77JNIbzXiH4CnjqHuHoDWLC2IzdILqdo3ipo0pRgEmGosp4xo2N7/W+1XYpx
	kXJ/AdzUTnKmWx+T9LL2bQ+5AFqSgC1Y+qslGwDH+eH0J9zPKx5Vm/t4snDf4YJocAfD
	rRAw==
X-Gm-Message-State: APjAAAVgeKIGJrY7zw5vDgeU7pH7+y8foF47cFDUODvHqTSPcAmwj69Y
	fRM0KpXigIPYfRqw7m4Bz2TgKlf5j7QlcyH7Qyu3YvZRJww=
X-Google-Smtp-Source: APXvYqxGmNhS7O0WYezZ5KKWcc7qENQZPHTzvK4iRd2jiksYSG3ib+sPBWVyqkn+Y5lNBSxxbI1mNOxM3EPGGfmqec0=
X-Received: by 2002:a24:ac3:: with SMTP id 186mr4260160itw.16.1556640970373;
	Tue, 30 Apr 2019 09:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190429220934.10415-1-agruenba@redhat.com>
	<20190429220934.10415-6-agruenba@redhat.com>
	<20190430153256.GF5200@magnolia>
	<CAHc6FU5hHFWeGM8+fhfaNs22cSG+wtuTKZcMMKbfeetg1CK4BQ@mail.gmail.com>
	<20190430154707.GG5200@magnolia>
In-Reply-To: <20190430154707.GG5200@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 30 Apr 2019 18:15:58 +0200
Message-ID: <CAHpGcMKVE2=6xpUdWyDo8=tyyCWGYaO=Ni0+B_fGJRXiqwdt5g@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 30 Apr 2019 16:16:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 30 Apr 2019 16:16:11 +0000 (UTC) for IP:'209.85.166.178'
	DOMAIN:'mail-it1-f178.google.com' HELO:'mail-it1-f178.google.com'
	FROM:'andreas.gruenbacher@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.166.178 mail-it1-f178.google.com 209.85.166.178
	mail-it1-f178.google.com <andreas.gruenbacher@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>, Mark Syms <Mark.Syms@citrix.com>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v7 5/5] gfs2: Fix iomap write page
	reclaim deadlock
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 30 Apr 2019 16:16:31 +0000 (UTC)

Am Di., 30. Apr. 2019 um 17:48 Uhr schrieb Darrick J. Wong
<darrick.wong@oracle.com>:
> Ok, I'll take the first four patches through the iomap branch and cc you
> on the pull request.

Ok great, thanks.

Andreas

