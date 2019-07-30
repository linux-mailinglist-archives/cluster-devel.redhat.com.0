Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E87AAB4
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Jul 2019 16:16:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77ED63082E61;
	Tue, 30 Jul 2019 14:16:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E231E60BE5;
	Tue, 30 Jul 2019 14:16:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E06E01800202;
	Tue, 30 Jul 2019 14:16:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UEGdAV017209 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 10:16:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C7225D971; Tue, 30 Jul 2019 14:16:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AC3B5D9C5
	for <cluster-devel@redhat.com>; Tue, 30 Jul 2019 14:16:35 +0000 (UTC)
To: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <c4de73fa-5594-347a-8c69-3a0cd04f9c42@redhat.com>
Date: Tue, 30 Jul 2019 15:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] The last 64 bits
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 30 Jul 2019 14:16:48 +0000 (UTC)

Hi,

We currently have 64 bits left over in the gfs2 metadata header. This is 
currently just padding, although we do zero it out when we add metadata 
blocks to transactions. I would like to ensure that we make the most of 
this space, and I've got a couple of ideas of how best to use it.

Firstly, we should be able to add checksums to our metadata quite 
easily. A crc32 would use half of the space available, and we should 
probably do the checksum at the point where we write the data into the 
log, so that it is then also correct for when it is written back in place.

The more tricky issue is what to do with the remaining 32 bits. One 
thought, is to come up with some scheme which (eventually) allows us to 
avoid having to write out revokes to the log. This would significantly 
speed up moving glocks from node to node, halving the number of log 
flushes when metadata has been updated. We could make it into a 
generation number, but is 32 bits enough? By incrementing it 
individually on each bit of metadata each time it goes through the log, 
we would get a better picture of whats going on, rather than just 
copying the low 32 bits of the log sequence number I think. That should 
be enough to make sure that we'd keep out of trouble even if someone is 
using a large (non-default) log size.

The question is whether there is anything else we might use those 32 
bits for that might give us an even bigger gain? Any thoughts?

I should mention that this is all for metadata - we'd have to do 
something different for jdata, since it doesn't have a header in this 
sense, but, one thing at a time!

Steve.


