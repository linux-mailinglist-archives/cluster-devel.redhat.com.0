Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E4585DAB5D
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Oct 2019 13:42:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5ECB4793EC;
	Thu, 17 Oct 2019 11:42:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C4A600C4;
	Thu, 17 Oct 2019 11:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CADC44EE50;
	Thu, 17 Oct 2019 11:42:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9HBfeQ0025048 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Oct 2019 07:41:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 058B35C290; Thu, 17 Oct 2019 11:41:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.109] (unknown [10.33.36.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26F875C1D8;
	Thu, 17 Oct 2019 11:41:35 +0000 (UTC)
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
References: <20191017110225.30841-1-ben.dooks@codethink.co.uk>
From: Andrew Price <anprice@redhat.com>
Message-ID: <25bb4857-950e-592a-b2ba-7730867742b3@redhat.com>
Date: Thu, 17 Oct 2019 12:41:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191017110225.30841-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: linux-kernel@lists.codethink.co.uk, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: make gfs2_fs_parameters static
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 17 Oct 2019 11:42:37 +0000 (UTC)

On 17/10/2019 12:02, Ben Dooks (Codethink) wrote:
> The gfs2_fs_parameters is not used outside the unit
> it is declared in, so make it static.
> 
> Fixes the following sparse warning:
> 
> fs/gfs2/ops_fstype.c:1331:39: warning: symbol 'gfs2_fs_parameters' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Bob Peterson <rpeterso@redhat.com>
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: cluster-devel@redhat.com
> Cc: linux-kernel@vger.kernel.org
> ---
>   fs/gfs2/ops_fstype.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 681b44682b0d..ebdef1c5f580 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -1328,7 +1328,7 @@ static const struct fs_parameter_enum gfs2_param_enums[] = {
>   	{}
>   };
>   
> -const struct fs_parameter_description gfs2_fs_parameters = {
> +static const struct fs_parameter_description gfs2_fs_parameters = {
>   	.name = "gfs2",
>   	.specs = gfs2_param_specs,
>   	.enums = gfs2_param_enums,
> 

Looks good to me.

Thanks,
Andy

