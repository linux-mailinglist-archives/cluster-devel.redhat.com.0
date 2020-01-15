Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 71E3113C691
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 15:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579099805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KnRnxFxs2eInSiWOltmglq8NKuXVrzdKWgRf3Hkfgew=;
	b=IJgceY4fJ6lQdTIit8KwNnmLmIKMZzcswI+9EFqmAqO9dsG7cPfpQZwJcqEka006JVGkXo
	/TRcIqGVxFJglKOVukEO2T0/jpNfevLAyms8aoLGHv4mVfRUXos8A+a1e0t8QvVXferNMG
	AF7um+Qli1kQ+1e8Q3NNwhyQQhvrehQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-JSKM4vm_NveU61OoLgT5Xw-1; Wed, 15 Jan 2020 09:50:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CFEE8005B4;
	Wed, 15 Jan 2020 14:49:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEFBA842A4;
	Wed, 15 Jan 2020 14:49:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE1CA18089C8;
	Wed, 15 Jan 2020 14:49:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FEntAU010059 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 09:49:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9B64C10D17B9; Wed, 15 Jan 2020 14:49:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9513D10D17AB
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 14:49:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0B3F80481E
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 14:49:52 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-222-S4maFFfhMY-Lq7ToIoJgyw-1; Wed, 15 Jan 2020 09:49:50 -0500
Received: by mail-qv1-f67.google.com with SMTP id t6so7453139qvs.5
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 06:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cm5cr0KkaFdqdflwJkN3g1ehM0Qx8fj0jos08WlEqzM=;
	b=DrNO+rDcuSqHqXTWze1Tew7gc1/YGSB9yZGJLKy9Vz76HOglSD7bYNtReh12oL3ENS
	dJYZ1U+9LzIUFS9FyNJf+k9X5tyIWQaTvq1bUHGUvKN3Y/jF+zleprr4LrSV7tlqCfKO
	qis8JGoIbU2omDlLisyIg3XwWyBeKLKSYJ3R8HMOo2P2F08tWqCoQzKrBUARsjm7FxYi
	+NkZqH0GbVH7eYxnS2WvkQUNmPeOUkR3jyGnq8LlQTuw2dCAdMlInirG3k9/5xPlfQAc
	bXCLw1d0XV89WprzhGa6ApuJN2RQQFMmK87MD0r44V35s7vMfcadm2ruYfFrGtPTc/9B
	fC3w==
X-Gm-Message-State: APjAAAVEb8tGTOfTYogkRCNsJGfX5vJCtXFz8PIP5fZR+T7lQDSN1gvt
	a3lW5weawSDqzb5x5uJW11vd0w==
X-Google-Smtp-Source: APXvYqyFIeQqkTbqfmHkLFxl6XwrUnGz4rIsK+5vF2sMxHxXVPVwnMtL57gUSF9TASMuieCBEj6hKA==
X-Received: by 2002:a05:6214:11a8:: with SMTP id
	u8mr26158641qvv.16.1579099789994; 
	Wed, 15 Jan 2020 06:49:49 -0800 (PST)
Received: from ziepe.ca
	(hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[142.68.57.212]) by smtp.gmail.com with ESMTPSA id
	n32sm9400465qtk.66.2020.01.15.06.49.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Jan 2020 06:49:49 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1irjzQ-0008QI-RY; Wed, 15 Jan 2020 10:49:48 -0400
Date: Wed, 15 Jan 2020 10:49:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200115144948.GB25201@ziepe.ca>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca> <20200115065614.GC21219@lst.de>
	<20200115132428.GA25201@ziepe.ca>
	<20200115143347.GL2827@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
In-Reply-To: <20200115143347.GL2827@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MC-Unique: S4maFFfhMY-Lq7ToIoJgyw-1
X-MC-Unique: JSKM4vm_NveU61OoLgT5Xw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00FEntAU010059
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] RFC: hold i_rwsem until aio completes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jan 15, 2020 at 03:33:47PM +0100, Peter Zijlstra wrote:
> On Wed, Jan 15, 2020 at 09:24:28AM -0400, Jason Gunthorpe wrote:
>=20
> > I was interested because you are talking about allowing the read/write =
side
> > of a rw sem to be held across a return to user space/etc, which is the
> > same basic problem.
>=20
> No it is not; allowing the lock to be held across userspace doesn't
> change the owner. This is a crucial difference, PI depends on there
> being a distinct owner. That said, allowing the lock to be held across
> userspace still breaks PI in that it completely wrecks the ability to
> analyze the critical section.

I'm not sure what you are contrasting?

I was remarking that I see many places open code a rwsem using an
atomic and a completion specifically because they need to do the
things Christoph identified:

> (1) no unlocking by another process than the one that acquired it
> (2) no return to userspace with locks held

As an example flow: obtain the read side lock, schedual a work queue,
return to user space, and unlock the read side from the work queue.

If we can make some general primative that addresses this then maybe
those open coded places can convert as well?

Regards,
Jason


