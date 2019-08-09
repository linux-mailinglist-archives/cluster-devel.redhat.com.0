Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5187856
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Aug 2019 13:26:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05DC2C00A16D;
	Fri,  9 Aug 2019 11:26:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0773A5D9DC;
	Fri,  9 Aug 2019 11:26:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E7562551B;
	Fri,  9 Aug 2019 11:26:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79BQfq3002825 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 07:26:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C47A51001925; Fri,  9 Aug 2019 11:26:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.95] (unknown [10.33.36.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC8810013A1;
	Fri,  9 Aug 2019 11:26:37 +0000 (UTC)
To: Daegyu Han <hdg9400@gmail.com>
References: <OFA15B94C2.57C7D335-ON49258451.002CE1A7@skku.ac.kr>
	<297cee57-8ee4-8f07-9f4b-357e5f272ab5@redhat.com>
	<CAARcW+rvKJV1o3kcCGueh42oYSAvReiuOLY+KO6vR+7C+e_OGg@mail.gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <92318ae4-319a-3c10-5568-78c2d1c5259f@redhat.com>
Date: Fri, 9 Aug 2019 12:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAARcW+rvKJV1o3kcCGueh42oYSAvReiuOLY+KO6vR+7C+e_OGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: =?UTF-8?B?7ZWc64yA6rec?= <hdg9400@skku.edu>, cluster-devel@redhat.com
Subject: Re: [Cluster-devel] How can be metadata(e.g.,
 inode) in the GFS2 file system shared between client nodes?
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 09 Aug 2019 11:26:49 +0000 (UTC)

On 09/08/2019 12:01, Daegyu Han wrote:
> Thank you for your reply.
> 
> If what I understand is correct,
> In a gfs2 file system shared by clients A and B, if A creates /foo/a.txt,
> does B re-read the filesystem metadata area on storage to keep the data
> consistent?

Yes, that's correct, although 'clients' is inaccurate as there is no 
'server'. Through the locking mechanism, B would know to re-read block 
allocation states and the contents of the /foo directory, so a path 
lookup on B would then find a.txt.

> After all, what makes gfs2 different from local filesystems like ext4,
> because of lock_dlm?

Exactly.

> In general, if we mount an ext4 file system on two different clients and
> update the file system on each client, we know that the file system state
> is not reflected in each other.

Yes.

Cheers,
Andy

> Thank you,
> Daegyu
> ᐧ
> 
> 2019년 8월 9일 (금) 오후 7:50, Andrew Price <anprice@redhat.com>님이 작성:
> 
>> Hi Daegyu,
>>
>> On 09/08/2019 09:10, 한대규 wrote:
>>> Hi, I'm Daegyu from Sungkyunkwan University.
>>>
>>> I'm curious how GFS2's filesystem metadata is shared between nodes.
>>
>> The key thing to know about gfs2 is that it is a shared storage
>> filesystem where each node mounts the same storage device. It is
>> different from a distributed filesystem where each node has storage
>> devices that only it accesses.
>>
>>> In detail, I wonder how the metadata in the memory of the node mounting
>> GFS2
>>> looks the consistent filesystem to other nodes.
>>
>> gfs2 uses dlm for locking of filesystem metadata among the nodes. The
>> transfer of locks between nodes allows gfs2 to decide when its in-memory
>> caches are invalid and require re-reading from the storage.
>>
>>> In addition, what role does corosync play in gfs2?
>>
>> gfs2 doesn't communicate with corosync directly but it operates on top
>> of a high-availability cluster. corosync provides synchronization and
>> coherency for the cluster. If a node stops responding, corosync will
>> notice and trigger actions (fencing) to make sure that node is put back
>> into a safe and consistent state. This is important in gfs2 to prevent
>> "misbehaving" nodes from corrupting the filesystem.
>>
>> Hope this helps.
>>
>> Cheers,
>> Andy
>>
>>
>>
> 

