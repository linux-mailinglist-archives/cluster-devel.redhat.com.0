Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6935539248A
	for <lists+cluster-devel@lfdr.de>; Thu, 27 May 2021 03:48:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-w8bpsl5mM5yNC_VAAy-KXQ-1; Wed, 26 May 2021 21:48:25 -0400
X-MC-Unique: w8bpsl5mM5yNC_VAAy-KXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07A75107ACCD;
	Thu, 27 May 2021 01:48:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F00DC59451;
	Thu, 27 May 2021 01:48:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01FD11800BBE;
	Thu, 27 May 2021 01:48:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14R1mBEQ001253 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 21:48:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 117E820E76D5; Thu, 27 May 2021 01:48:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D70120ED6BD
	for <cluster-devel@redhat.com>; Thu, 27 May 2021 01:48:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB157101D228
	for <cluster-devel@redhat.com>; Thu, 27 May 2021 01:48:08 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-526-DvbV-hDhP7a09JyjaN5m1Q-1; Wed, 26 May 2021 21:48:04 -0400
X-MC-Unique: DvbV-hDhP7a09JyjaN5m1Q-1
IronPort-SDR: Y9HZM0C1mRJFEG/88zdBySKiBE8X62dsEh5sIa9eBn35h2rn+5Ro7+Y9GImbUvWM8mpjXZqErm
	FRC6/by0ZzQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="190002031"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="190002031"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	26 May 2021 18:46:54 -0700
IronPort-SDR: bMRcO0HRtO1agjO8xC7Al44NUKXT4n6QbKKYFFa7Ns5zM5XyjDyh49tXWmSKbZ5bKAx6LUqs67
	2AnQaGsl/aJQ==
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="477258416"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.11]) ([10.239.13.11])
	by orsmga001-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 18:46:53 -0700
To: Alexander Ahring Oder Aring <aahringo@redhat.com>,
	kernel test robot <lkp@intel.com>
References: <202105260504.vtgCtU72-lkp@intel.com>
	<CAK-6q+hsBK9xYbqCkmgajXE87qa8FF9413ton6FojQ2n63sBnQ@mail.gmail.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <bf61e710-d6e7-f239-95d4-cf07f98e5f24@intel.com>
Date: Thu, 27 May 2021 09:45:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK-6q+hsBK9xYbqCkmgajXE87qa8FF9413ton6FojQ2n63sBnQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org
Subject: Re: [Cluster-devel] [dlm:next 14/16] fs/dlm/midcomms.c:541:25:
 sparse: sparse: cast to restricted __le32
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
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/26/21 11:20 PM, Alexander Ahring Oder Aring wrote:
> Hi,
>
> before somebody tried to fix it. Some comments, see below.
>
> On Tue, May 25, 2021 at 5:17 PM kernel test robot <lkp@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git next
>> head:   706474fbc5fedd7799b488962aad3541b235165b
>> commit: 489d8e559c6596eb08e16447d9830bc39afbe54e [14/16] fs: dlm: add reliable connection if reconnect
>> config: m68k-randconfig-s031-20210525 (attached as .config)
>> compiler: m68k-linux-gcc (GCC) 9.3.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # apt-get install sparse
>>          # sparse version: v0.6.3-341-g8af24329-dirty
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/commit/?id=489d8e559c6596eb08e16447d9830bc39afbe54e
>>          git remote add dlm https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git
>>          git fetch --no-tags dlm next
>>          git checkout 489d8e559c6596eb08e16447d9830bc39afbe54e
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=m68k
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
>>>> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
>>>> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
>>>> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
>>>> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
>>>> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:634:19: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:634:19: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:634:19: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:634:19: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:636:16: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:636:16: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:636:16: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:636:16: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:674:27: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:674:27: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:674:27: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:674:27: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:722:42: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:722:42: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:722:42: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:722:42: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:725:26: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:725:26: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:725:26: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:725:26: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:794:27: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:794:27: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:794:27: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:794:27: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:854:26: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:854:26: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:854:26: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:854:26: sparse: sparse: cast to restricted __le16
>>     fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>>     fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
> We can ignore it for now. The dlm code does some endian transfer with
> cpu_to_leFOO() and vice versa and never uses any __leFOO define. See
> header_in()/out() functions. Sure somebody is welcome to send patches
> and make sparse happy but it requires more code changes.
>
>>>> fs/dlm/midcomms.c:969:20: sparse: sparse: context imbalance in 'dlm_midcomms_get_mhandle' - wrong count at exit
>>     fs/dlm/midcomms.c:1045:33: sparse: sparse: context imbalance in 'dlm_midcomms_commit_mhandle' - unexpected unlock
>>
> That is false positive, we always assume a successful get_mhandle()
> triggers a commit_mhandle() and we keep the srcu nodes locked so that
> a reference isn't be freed, avoiding an extra lookup. There is also no
> logic to revert an allocated buffer, the complicated part will be to
> rearrange the buffer in the page buffer then which seems to be quite
> complex, so if there is a get_mhandle() there must be a
> commit_mhandle(). That was always be the case.
>
> - Alex
>

Hi Alex,

yes, the 'context imbalance' warning is false positive in most cases,
we can't ignore it because it can find real issue occasionally, thanks 
for the
detailed explanation.

Best Regards,
Rong Chen

