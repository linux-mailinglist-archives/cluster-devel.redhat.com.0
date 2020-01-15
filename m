Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BC97513C94D
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 17:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579105637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BGhoOyu5VQ9UNwECtfExQGuAJzqWLNe3068aiRd3j68=;
	b=gzfAgaYe2lfdpGrW8LK+tS3d7ypyc6wmulPv8Rh/osGYa+POCtXzQakoli2JPg/QSe4l50
	caSvcZWsUlzb1wP5oACHuvGvgaZn5grS7jSabuHQ2LxK1bQ5q1vtIN4vS3EcYL97cUxMJU
	w8+6wqD7KhqwVdcV+LRANHVuIaQ2WPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-6X6EXT3SMcyIHqgsITNfNA-1; Wed, 15 Jan 2020 11:27:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67E2F801F74;
	Wed, 15 Jan 2020 16:27:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7634910001AE;
	Wed, 15 Jan 2020 16:27:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4088E18089C8;
	Wed, 15 Jan 2020 16:27:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FGR5fV015313 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 11:27:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D75E210A4AFB; Wed, 15 Jan 2020 16:27:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2D6110A4AF6
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 16:27:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B982885A31C
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 16:27:03 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-42-V3tgZOTzOU2Os8QJDkfoPw-1; Wed, 15 Jan 2020 11:26:54 -0500
Received: by mail-qt1-f195.google.com with SMTP id d18so16244660qtj.10
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 08:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BGhoOyu5VQ9UNwECtfExQGuAJzqWLNe3068aiRd3j68=;
	b=S9xitdgZMGDP5vgGbIJp5LGveKUV9RBNJ/mgHPfx/ckQz10vV/62C509UC7HnNiICL
	zXYIK6wLfkDXNKZYL7MLix7A9fc496AiEysuXczg55kNFnlNo03jeBEo/1za5eQ3u35b
	L7qNKCxpYU7mF/2jZ/qm6x4ZHE8xVEpOmQTnWGSw6qdpE+qcoeNEnEpHrJK5OnEIICmj
	vaL4fYtgR6Wss5Vv4iBSFc3mfuNrNqUjdTyKtHx9shxPAre7i5BpiWLX5k6/jaX87zqU
	rde/fuJaNP0dsSM0Y62T0/S431+dsoB9Ljv2Sj8r9bP2dTKQpN/oL2Xm52HQEgbzDCDg
	e5cw==
X-Gm-Message-State: APjAAAUlrX+CKz17SmLQeWg6Aw7TqHkwqoTcGcv5HVDYfKr9FEMrx4DH
	QpJLRQzbHK6M97a3tgynMJ6DIw==
X-Google-Smtp-Source: APXvYqxK3fXxJYK2OHY5fNbL0IWIdwQXnxlcW9LltTOQTnJ8odVy9pqrM8Tc37VCTRCWaseM/4cyKQ==
X-Received: by 2002:ac8:4657:: with SMTP id f23mr4369118qto.378.1579105614247; 
	Wed, 15 Jan 2020 08:26:54 -0800 (PST)
Received: from ziepe.ca
	(hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[142.68.57.212]) by smtp.gmail.com with ESMTPSA id
	z141sm8675109qkb.63.2020.01.15.08.26.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Jan 2020 08:26:53 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1irlVN-0001qT-27; Wed, 15 Jan 2020 12:26:53 -0400
Date: Wed, 15 Jan 2020 12:26:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200115162653.GC25201@ziepe.ca>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca> <20200115065614.GC21219@lst.de>
	<20200115132428.GA25201@ziepe.ca> <20200115153614.GA31296@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200115153614.GA31296@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MC-Unique: V3tgZOTzOU2Os8QJDkfoPw-1
X-MC-Unique: 6X6EXT3SMcyIHqgsITNfNA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00FGR5fV015313
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jan 15, 2020 at 04:36:14PM +0100, Christoph Hellwig wrote:

> synchronous and currently hack that up, so a version of the percpu_ref
> that actually waits for the other references to away like we hacked
> up various places seems to exactly suit your requirements.

Ah, yes, sounds like a similar goal, many cases I'm thinking about
also hack up a kref to trigger a completion to make it
synchronous.

Jason


