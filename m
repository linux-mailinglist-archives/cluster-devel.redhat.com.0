Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A0DDD154824
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Feb 2020 16:32:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581003161;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JkkJGmIOTY9azTSJOAyBmE/D2+0ai1ViZFBb2hElwXY=;
	b=TN9xet9Cep6Y0xRnyGEGZGUjPm1OhgLmKGFEKPK7sCm3I6CLfC5HN3aVe9qmogmy5dlmLA
	lEf3LC2aUwKkWxMFhQinJBZlvWk+m0BCnK59WfFZb1dxZ0xEno2Lzue/B0CF+r6fFYBKDG
	VHUGfUjTBxU/y/1qipWEfFiSvKuUtDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-O2biAiBZO0ul6z0RglV1nw-1; Thu, 06 Feb 2020 10:32:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A05018AB2C6;
	Thu,  6 Feb 2020 15:32:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA79060BEC;
	Thu,  6 Feb 2020 15:32:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D206518089C8;
	Thu,  6 Feb 2020 15:32:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016FWSAd030040 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 10:32:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 96686107CD16; Thu,  6 Feb 2020 15:32:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90F9C107CD14
	for <cluster-devel@redhat.com>; Thu,  6 Feb 2020 15:32:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC7E98032A8
	for <cluster-devel@redhat.com>; Thu,  6 Feb 2020 15:32:16 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
	[209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-110-B0CXXAXsMwq1qZKjcbr46Q-1; Thu, 06 Feb 2020 10:32:11 -0500
Received: by mail-oi1-f197.google.com with SMTP id n196so3001113oig.6
	for <cluster-devel@redhat.com>; Thu, 06 Feb 2020 07:32:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JkkJGmIOTY9azTSJOAyBmE/D2+0ai1ViZFBb2hElwXY=;
	b=ineY+FW/Gud9fejJzuRF8LW0C49prCJhqKxin9M2tWaMyTC7sYfqGtMwu5iJnpBviF
	dI0HNq/SOjpPiVgcT31XSVsX5Y+9h48PmI+wx+0Qzbf0NPgYpYJ9R2rOV067Fjvpl/JG
	2L6RzLvmI8OVhLDc0D9mQM2d7RItZbX0gd4gL+dfzNQ+OJGbe/hbDtrNULlJY58SdW2r
	st+LxUZjeK4z+XN9ljrod6QmQFmdA2/zXgs29Ctmsc9LrNrQ26IM85JjRhU62G+WdDYp
	b0Ibr6/9FL0JZdcM1e198CqshQaJkbf/NcM5LjEAX1CswnfU/jtElqscrxNJpqRHmtkj
	77lA==
X-Gm-Message-State: APjAAAVEsagWJJ/KWA9vAwjUxfKO9kJlwnI1kCjgkwqWh38D6e5dNLxh
	EfQmR0xqhKpk6Zx2zTU/iutqenIa6CZtpv1mL2VbjN+Kgo5w+7228xVst7NxumvLOQIhjjcl3vd
	IlTlRojrQhxWTbvt2VmNaS9bsED/PL+Fa0QknqA==
X-Received: by 2002:aca:48d0:: with SMTP id v199mr7121512oia.10.1581003130604; 
	Thu, 06 Feb 2020 07:32:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqz63b3BCvjFz9bZiKofXwlA69pEYM2GvuAIssv4co0has6j21zg9p8DSROFpl+t1g3/AiFAiFF1ObcmOqpV8Jw=
X-Received: by 2002:aca:48d0:: with SMTP id v199mr7121485oia.10.1581003130363; 
	Thu, 06 Feb 2020 07:32:10 -0800 (PST)
MIME-Version: 1.0
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-6-hch@lst.de>
In-Reply-To: <20200114161225.309792-6-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 6 Feb 2020 16:31:58 +0100
Message-ID: <CAHc6FU45m59PjBWWO=F740_jyOtKSwc__XfYhP84WkpK0uqcWQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-MC-Unique: B0CXXAXsMwq1qZKjcbr46Q-1
X-MC-Unique: O2biAiBZO0ul6z0RglV1nw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 016FWSAd030040
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
	Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	linux-ext4 <linux-ext4@vger.kernel.org>, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Cluster-devel] [PATCH 05/12] gfs2: fix O_SYNC write handling
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

thanks for this patch, and sorry for taking so long to react.

On Tue, Jan 14, 2020 at 5:54 PM Christoph Hellwig <hch@lst.de> wrote:
> Don't ignore the return value from generic_write_sync for the direct to
> buffered I/O callback case when written is non-zero.  Also don't bother
> to call generic_write_sync for the pure direct I/O case, as iomap_dio_rw
> already takes care of that.

I like the idea, but the patch as is doesn't quite work: iomap_dio_rw
already bumps iocb->ki_pos, so we end up with the wrong value by
adding the (direct + buffered) write size again.
We'd probably also be better served by replacing
filemap_write_and_wait_range with generic_write_sync + IOCB_DSYNC in
the buffered fallback case. I'll send an update that you'll hopefully
like.

Andreas


