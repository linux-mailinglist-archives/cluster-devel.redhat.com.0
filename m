Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D3B3813B230
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 19:33:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579026826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VU3iLjKmaQ0aNJQ9ZbgSwibwLQ11TCA8buR9ZQY0R+A=;
	b=EgJjbpd7SNWgaCS8HuVcis9fjNtsQDlZHzFLskKOpHM9ZTLJzQc1O48GRCkDfERhkD4QJg
	TCNaNSjiK86Wm+KA04LOsi6EGPdd4QkD74K3/WRjfj/pJ4/TFX2bnd7Bjz3Qy7oizhsekj
	2ELnZTPx1zI2j7Eapb0kjTRalIKi3RU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-LAkvaQU4OqWLEtl2bZKHjw-1; Tue, 14 Jan 2020 13:33:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F00F310054E3;
	Tue, 14 Jan 2020 18:33:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 568A326FB3;
	Tue, 14 Jan 2020 18:33:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7619E18089CD;
	Tue, 14 Jan 2020 18:33:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EIXcNt028715 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 13:33:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AAE0F5C290; Tue, 14 Jan 2020 18:33:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from llong.remote.csb (ovpn-122-218.rdu2.redhat.com [10.10.122.218])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8900F5C1D6;
	Tue, 14 Jan 2020 18:33:33 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-3-hch@lst.de>
	<925d1343-670e-8f92-0e73-6e9cee0d3ffb@redhat.com>
	<20200114182514.GA9949@lst.de>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <478b3737-79e1-33a9-ac44-c6656e83adf5@redhat.com>
Date: Tue, 14 Jan 2020 13:33:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200114182514.GA9949@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: LAkvaQU4OqWLEtl2bZKHjw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 1/14/20 1:25 PM, Christoph Hellwig wrote:
> On Tue, Jan 14, 2020 at 01:17:45PM -0500, Waiman Long wrote:
>> The owner field is just a pointer to the task structure with the lower 3
>> bits served as flag bits. Setting owner to RWSEM_OWNER_UNKNOWN (-2) will
>> stop optimistic spinning. So under what condition did the crash happen?
> When running xfstests with all patches in this series except for this
> one, IIRC in generic/114.

OK, I think I know where the bug is. I will send a patch to fix that.

Thanks,
Longman


