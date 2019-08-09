Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADD4879E6
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Aug 2019 14:26:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4C8772642;
	Fri,  9 Aug 2019 12:26:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0953F5C290;
	Fri,  9 Aug 2019 12:26:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DB2618005B9;
	Fri,  9 Aug 2019 12:26:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79CQ8BS011467 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 08:26:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA059600CE; Fri,  9 Aug 2019 12:26:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.95] (unknown [10.33.36.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2875600CD;
	Fri,  9 Aug 2019 12:26:04 +0000 (UTC)
To: Daegyu Han <hdg9400@gmail.com>
References: <OFA15B94C2.57C7D335-ON49258451.002CE1A7@skku.ac.kr>
	<297cee57-8ee4-8f07-9f4b-357e5f272ab5@redhat.com>
	<CAARcW+rvKJV1o3kcCGueh42oYSAvReiuOLY+KO6vR+7C+e_OGg@mail.gmail.com>
	<92318ae4-319a-3c10-5568-78c2d1c5259f@redhat.com>
	<CAARcW+qwyxA7V26k8hs8NPASuYrmi75tfY06Hz5ei5O66AretA@mail.gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <dc403e01-3517-72af-e0ec-b5287089f135@redhat.com>
Date: Fri, 9 Aug 2019 13:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAARcW+qwyxA7V26k8hs8NPASuYrmi75tfY06Hz5ei5O66AretA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 09 Aug 2019 12:26:17 +0000 (UTC)

On 09/08/2019 12:46, Daegyu Han wrote:
> Thank you for the clarification.
> 
> I have one more question.
> 
> I've seen some web page by redhat and it says that gfs2 has a poor
> filesystem performance (i.e. throughput) compared to xfs or ext4.
> [image: image.png]
> 
> In a high performance hardware environment (nvme over fabric, infiniband
> (56G)), I ran a FIO benchmark, expecting GFS2 to be comparable to local
> filesystems (ext4, xfs).
> 
> Unexpectedly, however, GFS2 showed 25% lower IOPS or throughput than ext4,
> as the web page results.
> 
> Does GFS2 perform worse than EXT4 or XFS even on high-performance network +
> storage?

gfs2 has performance overheads that ext4 and xfs don't encounter due to 
the extra work it has to do to keep the fs consistent across the 
cluster, such as the extra cache invalidation we've discussed, journal 
flushing and updates to structures relating to quotas and statfs. Even 
in a single-node configuration, extra codepaths are still active (but 
gfs2 isn't meant to be used as a single-node fs, so fio is not a good 
demonstration of its strengths). It's also worth noting that gfs2 is not 
extent-based so you may see performance differences relating to that. We 
are continually working to minimise the overheads, of course.

The size of the performance difference is highly dependent on the 
workload and access pattern. (Clustered) applications looking to get the 
best performance out of gfs2 will have each node processing its own 
working set - preferably in its own subdirectory - which will minimise 
the overheads.

Cheers,
Andy

> Thank you,
> Daegyu
> ᐧ
> 
> 2019년 8월 9일 (금) 오후 8:26, Andrew Price <anprice@redhat.com>님이 작성:
> 
>> On 09/08/2019 12:01, Daegyu Han wrote:
>>> Thank you for your reply.
>>>
>>> If what I understand is correct,
>>> In a gfs2 file system shared by clients A and B, if A creates /foo/a.txt,
>>> does B re-read the filesystem metadata area on storage to keep the data
>>> consistent?
>>
>> Yes, that's correct, although 'clients' is inaccurate as there is no
>> 'server'. Through the locking mechanism, B would know to re-read block
>> allocation states and the contents of the /foo directory, so a path
>> lookup on B would then find a.txt.
>>
>>> After all, what makes gfs2 different from local filesystems like ext4,
>>> because of lock_dlm?
>>
>> Exactly.
>>
>>> In general, if we mount an ext4 file system on two different clients and
>>> update the file system on each client, we know that the file system state
>>> is not reflected in each other.
>>
>> Yes.
>>
>> Cheers,
>> Andy
>>
>>> Thank you,
>>> Daegyu
>>> ᐧ
>>>
>>> 2019년 8월 9일 (금) 오후 7:50, Andrew Price <anprice@redhat.com>님이 작성:
>>>
>>>> Hi Daegyu,
>>>>
>>>> On 09/08/2019 09:10, 한대규 wrote:
>>>>> Hi, I'm Daegyu from Sungkyunkwan University.
>>>>>
>>>>> I'm curious how GFS2's filesystem metadata is shared between nodes.
>>>>
>>>> The key thing to know about gfs2 is that it is a shared storage
>>>> filesystem where each node mounts the same storage device. It is
>>>> different from a distributed filesystem where each node has storage
>>>> devices that only it accesses.
>>>>
>>>>> In detail, I wonder how the metadata in the memory of the node mounting
>>>> GFS2
>>>>> looks the consistent filesystem to other nodes.
>>>>
>>>> gfs2 uses dlm for locking of filesystem metadata among the nodes. The
>>>> transfer of locks between nodes allows gfs2 to decide when its in-memory
>>>> caches are invalid and require re-reading from the storage.
>>>>
>>>>> In addition, what role does corosync play in gfs2?
>>>>
>>>> gfs2 doesn't communicate with corosync directly but it operates on top
>>>> of a high-availability cluster. corosync provides synchronization and
>>>> coherency for the cluster. If a node stops responding, corosync will
>>>> notice and trigger actions (fencing) to make sure that node is put back
>>>> into a safe and consistent state. This is important in gfs2 to prevent
>>>> "misbehaving" nodes from corrupting the filesystem.
>>>>
>>>> Hope this helps.
>>>>
>>>> Cheers,
>>>> Andy
>>>>
>>>>
>>>>
>>>
>>
> 

