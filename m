Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DB4B513B20C
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 19:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579026331;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UTLCDe7TBZXfP2bap4VtBoO5rN5xLcpDtORAkTcIQd0=;
	b=A0ytrv+ludR9WPtV8tscg6/l2vnKP2mBuhSODAQvjFPqr+vz5EcV4H5HG3abDT2OSBFlHg
	HujfOw2sxFBJwhMRvur674DEZwzqCOtm+uy1dCqlMRCeL7LzxkcgZIvToRKvWh/UKElFnx
	79tdy9QeSQSZ0fV0YjIMYVimDinTK4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-tydgCW9_P4mLr7ZHOshBhg-1; Tue, 14 Jan 2020 13:25:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1403F107ACC4;
	Tue, 14 Jan 2020 18:25:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2A085C1D6;
	Tue, 14 Jan 2020 18:25:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3432C8250D;
	Tue, 14 Jan 2020 18:25:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EIPN0i028396 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 13:25:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 87A69DBF2D; Tue, 14 Jan 2020 18:25:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83A67D1D0E
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 18:25:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF62A801E91
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 18:25:21 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-93-Rlqz3pbNObGe9LFh2GAFEA-1;
	Tue, 14 Jan 2020 13:25:17 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2D94A68AFE; Tue, 14 Jan 2020 19:25:14 +0100 (CET)
Date: Tue, 14 Jan 2020 19:25:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Waiman Long <longman@redhat.com>
Message-ID: <20200114182514.GA9949@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-3-hch@lst.de>
	<925d1343-670e-8f92-0e73-6e9cee0d3ffb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <925d1343-670e-8f92-0e73-6e9cee0d3ffb@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: Rlqz3pbNObGe9LFh2GAFEA-1
X-MC-Unique: tydgCW9_P4mLr7ZHOshBhg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EIPN0i028396
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH 02/12] locking/rwsem: Exit early when
 held by an anonymous owner
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 14, 2020 at 01:17:45PM -0500, Waiman Long wrote:
> The owner field is just a pointer to the task structure with the lower 3
> bits served as flag bits. Setting owner to RWSEM_OWNER_UNKNOWN (-2) will
> stop optimistic spinning. So under what condition did the crash happen?

When running xfstests with all patches in this series except for this
one, IIRC in generic/114.

> Anyway, PeterZ is working on revising the percpu-rwsem implementation to
> more gracefully handle the frozen case. At the end, there will not be a
> need for the RWSEM_OWNER_UNKNOWN magic and it can be removed.

Well, this series relies on that value.  And I think it fundamentally
is the right thing to do for AIO, and potentially other I/O related
locking where we take a lock to synchronize access to data, then
do I/O and then eventually get an I/O completion from an interrupt.
Even thinking from the PREEMP_RT context we want to boost the
initial thread as long as we can, then do nothing when it is off
to I/O hardware (except maybe providing good diagnostics that the cause
for the latency is I/O), and then boost the thread that is handling
the completion.  Things like the i_dio_count hack can't provide that.


