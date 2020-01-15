Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 825A013B9E2
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 07:48:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579070931;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SoV8+UKiMz6dHRH9UZ3WppdR0WliVRqnHsPfeyA5rg4=;
	b=NV7rYYOmSV3Q/xFNyGwGiW6C8NNYJfIccHAVjRy7SzfUQvZ7GfXWe/2s7W5HAfiCt4svDY
	+EsVNEwHiTF7TBKN8IhnbWksgyQysIJS1d9hXDhdb2dhJqY6X5aHXS6KA9+IZ+DW2ISqPp
	aCtqcpIvfWsnBqGBRZb9yvsVTvZ33bU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-mOFPM-qrM7y57EeikShCow-1; Wed, 15 Jan 2020 01:48:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 363BA100550E;
	Wed, 15 Jan 2020 06:48:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 892CE6609E;
	Wed, 15 Jan 2020 06:48:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07B89824EC;
	Wed, 15 Jan 2020 06:48:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F6mbpk010927 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 01:48:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E74DC2026D68; Wed, 15 Jan 2020 06:48:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F082026D67
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 06:48:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5FFD80157D
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 06:48:34 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-56-fueZ1UgyPq-QrR5zTOWYaA-1;
	Wed, 15 Jan 2020 01:48:31 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7952D68AFE; Wed, 15 Jan 2020 07:48:27 +0100 (CET)
Date: Wed, 15 Jan 2020 07:48:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20200115064827.GA21176@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-9-hch@lst.de>
	<20200114215023.GH140865@mit.edu>
MIME-Version: 1.0
In-Reply-To: <20200114215023.GH140865@mit.edu>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: fueZ1UgyPq-QrR5zTOWYaA-1
X-MC-Unique: mOFPM-qrM7y57EeikShCow-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00F6mbpk010927
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH 08/12] ext4: hold i_rwsem until AIO
	completes
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 14, 2020 at 04:50:23PM -0500, Theodore Y. Ts'o wrote:
> I note that you've dropped the inode_dio_wait() in ext4's ZERO_RANGE,
> COLLAPSE_RANGE, INSERT_RANGE, etc.  We had added these to avoid
> problems when various fallocate operations which modify the inode's
> logical->physical block mapping racing with direct I/O (both reads or
> writes).
>=20
> I don't see a replacement protection in this patch series.  How does
> are file systems supported to protect against such races?

By holding i_rwsem until the direct I/O operations are finished, and
not just until they are sumbitted.


