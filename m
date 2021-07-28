Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 73B9D3D8730
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 07:39:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-LAYslBl0Oe6q1Koo4BcGcg-1; Wed, 28 Jul 2021 01:39:45 -0400
X-MC-Unique: LAYslBl0Oe6q1Koo4BcGcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C5D2190A7A0;
	Wed, 28 Jul 2021 05:39:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F6D960BD9;
	Wed, 28 Jul 2021 05:39:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A5BE4BB7C;
	Wed, 28 Jul 2021 05:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16S5de0H026617 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 01:39:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C793E1112C06; Wed, 28 Jul 2021 05:39:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2D8B115D7DC
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 05:39:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00C3918A0160
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 05:39:34 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-341-q6P5BnioOlWvQHheDq6Gew-1;
	Wed, 28 Jul 2021 01:39:29 -0400
X-MC-Unique: q6P5BnioOlWvQHheDq6Gew-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6512867357; Wed, 28 Jul 2021 07:39:27 +0200 (CEST)
Date: Wed, 28 Jul 2021 07:39:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bob Peterson <rpeterso@redhat.com>
Message-ID: <20210728053927.GB3374@lst.de>
References: <20210726140058.GA9206@lst.de>
	<612d262a-e997-e887-ade9-1edc5efab758@redhat.com>
	<20210727070546.GA12839@lst.de>
	<41435c9a-0e0c-e02b-495b-3425734b94c0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <41435c9a-0e0c-e02b-495b-3425734b94c0@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] gfs2 hang in xfstests generic/361 (v3)
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2021 at 11:41:03AM -0500, Bob Peterson wrote:
> On 7/27/21 2:05 AM, Christoph Hellwig wrote:
>> On Mon, Jul 26, 2021 at 01:50:11PM -0500, Bob Peterson wrote:
>>> FYI: I just pushed a replacement patch to linux-gfs2/for-next.next4.
>>> The patch I mentioned last time had problems, so this is a simplified
>>> middle-ground between that patch and the one I suggested earlier.
>>> Patch is a89a427e0afe.
>>
>> With just that patch cherry picked the test still hangs.
>>
>> The entire linux-gfs2/for-next.next4 completes a quick group xfstests
>> run, but with a lot of failures:
>>
>> Failures: generic/079 generic/082 generic/092 generic/094 generic/103 generic/219 generic/230 generic/235 generic/244 generic/294 generic/306 generic/347 generic/379 generic/380 generic/382 generic/383 generic/384 generic/385 generic/386 generic/400 generic/441 generic/452 generic/488 generic/545 generic/566 generic/587 generic/594 generic/600 generic/601 generic/603
>> Failed 30 of 514 tests
>>
> Hi Christoph,
>
> Can you please pull my latest linux-gfs2/for-next.next4 branch and try your 
> full run again? I added a patch to not treat the usrquota / grpquota / 
> prjquota mount options as errors, and I added a new patch from Andreas for 
> generic/079 and it all seems to work okay for me
> (although I haven't done a full run yet). TIA.

Failures: generic/082 generic/092 generic/094 generic/103 generic/219 generic/230 generic/235 generic/294 generic/306 generic/347 generic/371 generic/382 generic/441 generic/452 generic/488 generic/545 generic/566 generic/587 generic/600 generic/601
Failed 20 of 514 tests

