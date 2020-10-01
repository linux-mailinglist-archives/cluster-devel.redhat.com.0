Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B9009280150
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Oct 2020 16:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601562797;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VqK60cyuFammhfcYDA052/XdlDqgQOG6D0hj1VMrVQ0=;
	b=DBVOQfhUNeNlKE0vCcV4LqKk78zHg6IhzEhWjSaEKP8TI5RNvVofzEabmuDcCWat5MEtF4
	XJDR9072DWQjRgPRv29zFA3LHQdEsFihaRLxZ7nIE58njNa+CqsHotZASeNF/ZzfC+1yAn
	xFZnAokbYmRrhZw2ityufdu4P2AMYU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-JeEf6d8lOwKa8-5_6T87hQ-1; Thu, 01 Oct 2020 10:33:16 -0400
X-MC-Unique: JeEf6d8lOwKa8-5_6T87hQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F4838015FD;
	Thu,  1 Oct 2020 14:33:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3A6D7367E;
	Thu,  1 Oct 2020 14:33:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C90AB44A58;
	Thu,  1 Oct 2020 14:33:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091EWE4q001411 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 10:32:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B442A7367B; Thu,  1 Oct 2020 14:32:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F5E573671
	for <cluster-devel@redhat.com>; Thu,  1 Oct 2020 14:32:10 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  1 Oct 2020 15:32:06 +0100
Message-Id: <20201001143208.1893890-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/3] mkfs.gfs2: Only call exit() from main()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 262 ++++++++++++++++++++++++++----------------
 1 file changed, 162 insertions(+), 100 deletions(-)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 325d5345..b8aa22b4 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -142,7 +142,7 @@ struct mkfs_opts {
 	unsigned quiet:1;
 	unsigned debug:1;
 	unsigned confirm:1;
-	unsigned align:1;
+	unsigned align;
 };
 
 static void opts_init(struct mkfs_opts *opts)
@@ -208,7 +208,7 @@ static long long cvtnum(unsigned int blocksize, unsigned int sectorsize, const c
                 if (blocksize)
                         return i * blocksize;
                 fprintf(stderr, _("Block size not available yet.\n"));
-		exit(1);
+		return -1LL;
         }
         if (*sp == 's' && sp[1] == '\0') {
                 if (sectorsize)
@@ -230,31 +230,36 @@ static long long cvtnum(unsigned int blocksize, unsigned int sectorsize, const c
         return -1LL;
 }
 
-static unsigned long parse_ulong(struct mkfs_opts *opts, const char *key, const char *val)
+static int parse_ulong(struct mkfs_opts *opts, const char *key, const char *val, unsigned long *pn)
 {
 	long long l;
 	if (val == NULL || *val == '\0') {
 		fprintf(stderr, _("Missing argument to '%s'\n"), key);
-		exit(-1);
+		return -1;
 	}
 	l = cvtnum(opts->bsize, 0, val);
 	if (l > ULONG_MAX || l < 0) {
 		fprintf(stderr, _("Value of '%s' is invalid\n"), key);
-		exit(-1);
+		return -1;
 	}
-	return (unsigned long)l;
+	*pn = (unsigned long)l;
+	return 0;
 }
 
-static unsigned parse_bool(struct mkfs_opts *opts, const char *key, const char *val)
+static int parse_bool(struct mkfs_opts *opts, const char *key, const char *val, unsigned *pbool)
 {
 	if (strnlen(val, 2) == 1) {
-		if (*val == '0')
+		if (*val == '0') {
+			*pbool = 0;
 			return 0;
-		if (*val == '1')
-			return 1;
+		}
+		if (*val == '1') {
+			*pbool = 1;
+			return 0;
+		}
 	}
 	fprintf(stderr, _("Option '%s' must be either 1 or 0\n"), key);
-	exit(-1);
+	return -1;
 }
 
 static int parse_topology(struct mkfs_opts *opts, char *str)
@@ -274,7 +279,8 @@ static int parse_topology(struct mkfs_opts *opts, char *str)
 			fprintf(stderr, "Too many topology values.\n");
 			return 1;
 		}
-		*topol[i] = parse_ulong(opts, "test_topology", opt);
+		if (parse_ulong(opts, "test_topology", opt, topol[i]))
+			return 1;
 		i++;
 	}
 	if (i < 5) {
@@ -284,7 +290,7 @@ static int parse_topology(struct mkfs_opts *opts, char *str)
 	return 0;
 }
 
-static void opt_parse_extended(char *str, struct mkfs_opts *opts)
+static int opt_parse_extended(char *str, struct mkfs_opts *opts)
 {
 	char *opt;
 	while ((opt = strsep(&str, ",")) != NULL) {
@@ -292,34 +298,39 @@ static void opt_parse_extended(char *str, struct mkfs_opts *opts)
 		char *val = strsep(&opt, "=");
 		if (key == NULL || *key == '\0') {
 			fprintf(stderr, _("Missing argument to '-o' option\n"));
-			exit(-1);
+			return -1;
 		}
 		if (strcmp("sunit", key) == 0) {
-			opts->sunit = parse_ulong(opts, "sunit", val);
+			if (parse_ulong(opts, "sunit", val, &opts->sunit) != 0)
+				return -1;
 			opts->got_sunit = 1;
 		} else if (strcmp("swidth", key) == 0) {
-			opts->swidth = parse_ulong(opts, "swidth", val);
+			if (parse_ulong(opts, "swidth", val, &opts->swidth) != 0)
+				return -1;
 			opts->got_swidth = 1;
 		} else if (strcmp("align", key) == 0) {
-			opts->align = parse_bool(opts, "align", val);
+			if (parse_bool(opts, "align", val, &opts->align) != 0)
+				return -1;
 		} else if (strcmp("test_topology", key) == 0) {
 			if (parse_topology(opts, val) != 0)
-				exit(-1);
+				return -1;
 			opts->got_topol = (opts->dev.logical_sector_size != 0 &&
 	                                   opts->dev.physical_sector_size != 0);
 		} else if (strcmp("help", key) == 0) {
 			print_ext_opts();
-			exit(0);
+			return 1;
 		} else {
 			fprintf(stderr, _("Invalid extended option (specified with -o): '%s'\n"), key);
 			print_ext_opts();
-			exit(-1);
+			return -1;
 		}
 	}
+	return 0;
 }
 
-static void opts_get(int argc, char *argv[], struct mkfs_opts *opts)
+static int opts_get(int argc, char *argv[], struct mkfs_opts *opts)
 {
+	int ret;
 	int c;
 	while (1) {
 		c = getopt(argc, argv, "-b:c:DhJ:j:KOo:p:qr:t:V");
@@ -341,7 +352,7 @@ static void opts_get(int argc, char *argv[], struct mkfs_opts *opts)
 			break;
 		case 'h':
 			print_usage(argv[0]);
-			exit(0);
+			return 1;
 		case 'J':
 			opts->jsize = atoi(optarg);
 			opts->got_jsize = 1;
@@ -372,18 +383,20 @@ static void opts_get(int argc, char *argv[], struct mkfs_opts *opts)
 			opts->got_rgsize = 1;
 			break;
 		case 'o':
-			opt_parse_extended(optarg, opts);
+			ret = opt_parse_extended(optarg, opts);
+			if (ret != 0)
+				return ret;
 			break;
 		case 'V':
 			printf("mkfs.gfs2 %s (built %s %s)\n", VERSION,
 			       __DATE__, __TIME__);
 			printf(REDHAT_COPYRIGHT "\n");
-			exit(EXIT_SUCCESS);
+			return 1;
 			break;
 		case ':':
 		case '?':
 			fprintf(stderr, _("Please use '-h' for help.\n"));
-			exit(EXIT_FAILURE);
+			return -1;
 			break;
 		case 1:
 			if (strcmp(optarg, "gfs2") == 0)
@@ -394,24 +407,27 @@ static void opts_get(int argc, char *argv[], struct mkfs_opts *opts)
 			} else if (!opts->got_fssize && isdigit(optarg[0])) {
 				opts->fssize = atol(optarg);
 				opts->got_fssize = 1;
-			} else
-				die( _("More than one device specified (try -h for help)\n"));
+			} else {
+				fprintf(stderr, _("More than one device specified (try -h for help)\n"));
+				return -1;
+			}
 			break;
 		default:
-			die( _("Invalid option: %c\n"), c);
-			break;
+			fprintf(stderr, _("Invalid option: %c\n"), c);
+			return -1;
 		};
 	}
+	return 0;
 }
 
 /**
- * test_locking - Make sure the GFS2 is set up to use the right lock protocol
+ * Make sure the GFS2 is set up to use the right lock protocol
  * @lockproto: the lock protocol to mount
  * @locktable: the locktable name
  *
  */
 
-static void test_locking(struct mkfs_opts *opts)
+static int test_locking(struct mkfs_opts *opts)
 {
 	const char *c;
 	/* Translators: A lock table is a string identifying a gfs2 file system
@@ -420,45 +436,61 @@ static void test_locking(struct mkfs_opts *opts)
 	int table_required = (strcmp(opts->lockproto, "lock_gulm") == 0)
 	                  || (strcmp(opts->lockproto, "lock_dlm") == 0);
 
-	if ((strcmp(opts->lockproto, "lock_nolock") != 0) && !table_required)
-		die( _("Invalid lock protocol: %s\n"), opts->lockproto);
-
+	if ((strcmp(opts->lockproto, "lock_nolock") != 0) && !table_required) {
+		fprintf(stderr, _("Invalid lock protocol: %s\n"), opts->lockproto);
+		return -1;
+	}
 	/* When lock_*lm is given as the lock protocol, require a lock table too */
 	if (!opts->got_locktable) {
 		if (table_required) {
 			fprintf(stderr, _("No lock table specified.\n"));
-			exit(-1);
+			return -1;
 		}
-		return;
+		return 0;
 	}
 	/* User gave a lock table option, validate it */
 	if (*opts->locktable == '\0') {
 		fprintf(stderr, _("Lock table is empty.\n"));
-		exit(-1);
+		return -1;
 	}
 	for (c = opts->locktable; *c; c++) {
-		if (!isalnum(*c) && (*c != '-') && (*c != '_') && (*c != ':'))
-			die("%s %s '%c'\n", errprefix, _("invalid character"), *c);
+		if (!isalnum(*c) && (*c != '-') && (*c != '_') && (*c != ':')) {
+			fprintf(stderr, "%s %s '%c'\n", errprefix, _("invalid character"), *c);
+			return -1;
+		}
 	}
 	c = strstr(opts->locktable, ":");
-	if (!c)
-		die("%s %s\n", errprefix, _("missing colon"));
+	if (!c) {
+		fprintf(stderr, "%s %s\n", errprefix, _("missing colon"));
+		return -1;
+	}
 
-	if (c == opts->locktable)
-		die("%s %s\n", errprefix, _("cluster name is missing"));
-	if (c - opts->locktable > 32)
-		die("%s %s\n", errprefix, _("cluster name is too long"));
+	if (c == opts->locktable) {
+		fprintf(stderr, "%s %s\n", errprefix, _("cluster name is missing"));
+		return -1;
+	}
+	if (c - opts->locktable > 32) {
+		fprintf(stderr, "%s %s\n", errprefix, _("cluster name is too long"));
+		return -1;
+	}
 
 	c++;
-	if (strstr(c, ":"))
-		die("%s %s\n", errprefix, _("contains more than one colon"));
-	if (!strlen(c))
-		die("%s %s\n", errprefix, _("file system name is missing"));
-	if (strlen(c) > 30)
-		die("%s %s\n", errprefix, _("file system name is too long"));
+	if (strstr(c, ":")) {
+		fprintf(stderr, "%s %s\n", errprefix, _("contains more than one colon"));
+		return -1;
+	}
+	if (!strlen(c)) {
+		fprintf(stderr, "%s %s\n", errprefix, _("file system name is missing"));
+		return -1;
+	}
+	if (strlen(c) > 30) {
+		fprintf(stderr, "%s %s\n", errprefix, _("file system name is too long"));
+		return -1;
+	}
+	return 0;
 }
 
-static void are_you_sure(void)
+static int are_you_sure(void)
 {
 	while (1) {
 		char *line = NULL;
@@ -478,14 +510,14 @@ static void are_you_sure(void)
 		if (ret <= 0)
 			continue;
 		if (res == 1) /* Yes */
-			return;
+			return 1;
 		if (res == 0) /* No */
-			exit(1);
+			return 0;
 		/* Unrecognized input; go again. */
 	};
 }
 
-static unsigned choose_blocksize(struct mkfs_opts *opts)
+static int choose_blocksize(struct mkfs_opts *opts, unsigned *pbsize)
 {
 	unsigned int x;
 	unsigned int bsize = opts->bsize;
@@ -512,57 +544,68 @@ static unsigned choose_blocksize(struct mkfs_opts *opts)
 		         dev->physical_sector_size >= GFS2_DEFAULT_BSIZE)
 			bsize = dev->physical_sector_size;
 	}
-
 	/* Block sizes must be a power of two from 512 to 65536 */
 	for (x = 512; x; x <<= 1)
 		if (x == bsize)
 			break;
 
-	if (!x || bsize > getpagesize())
-		die( _("Block size must be a power of two between 512 and %d\n"),
-		       getpagesize());
-
+	if (!x || bsize > getpagesize()) {
+		fprintf(stderr, _("Block size must be a power of two between 512 and %d\n"),
+		        getpagesize());
+		return -1;
+	}
 	if (bsize < dev->logical_sector_size) {
-		die( _("Error: Block size %d is less than minimum logical "
+		fprintf(stderr, _("Error: Block size %d is less than minimum logical "
 		       "block size (%lu).\n"), bsize, dev->logical_sector_size);
+		return -1;
 	}
-
 	if (bsize < dev->physical_sector_size) {
 		printf( _("Warning: Block size %d is inefficient because it "
 			  "is less than the physical block size (%lu).\n"),
 			  bsize, dev->physical_sector_size);
 		opts->confirm = 1;
 	}
-	return bsize;
+	*pbsize = bsize;
+	return 0;
 }
 
-static void opts_check(struct mkfs_opts *opts)
+static int opts_check(struct mkfs_opts *opts)
 {
 	if (!opts->got_device) {
 		fprintf(stderr, _("No device specified. Use -h for help\n"));
-		exit(1);
+		return -1;
 	}
 
-	test_locking(opts);
+	if (test_locking(opts) != 0)
+		return -1;
 
-	if (GFS2_MIN_RGSIZE > opts->rgsize || opts->rgsize > GFS2_MAX_RGSIZE)
+	if (GFS2_MIN_RGSIZE > opts->rgsize || opts->rgsize > GFS2_MAX_RGSIZE) {
 		/* Translators: gfs2 file systems are split into equal sized chunks called
 		   resource groups. We're checking that the user gave a valid size for them. */
-		die( _("bad resource group size\n"));
+		fprintf(stderr, _("bad resource group size\n"));
+		return -1;
+	}
 
-	if (!opts->journals)
-		die( _("no journals specified\n"));
+	if (!opts->journals) {
+		fprintf(stderr, _("no journals specified\n"));
+		return -1;
+	}
 
-	if (opts->jsize < GFS2_MIN_JSIZE || opts->jsize > GFS2_MAX_JSIZE)
-		die( _("bad journal size\n"));
+	if (opts->jsize < GFS2_MIN_JSIZE || opts->jsize > GFS2_MAX_JSIZE) {
+		fprintf(stderr, _("bad journal size\n"));
+		return -1;
+	}
 
-	if (!opts->qcsize || opts->qcsize > 64)
-		die( _("bad quota change size\n"));
+	if (!opts->qcsize || opts->qcsize > 64) {
+		fprintf(stderr, _("bad quota change size\n"));
+		return -1;
+	}
 
 	if ((opts->got_sunit && !opts->got_swidth) || (!opts->got_sunit && opts->got_swidth)) {
 		fprintf(stderr, _("Stripe unit and stripe width must be specified together\n"));
-		exit(1);
+		return -1;
 	}
+	return 0;
 }
 
 static void print_results(struct gfs2_sb *sb, struct mkfs_opts *opts, uint64_t rgrps, uint64_t fssize)
@@ -591,20 +634,20 @@ static void print_results(struct gfs2_sb *sb, struct mkfs_opts *opts, uint64_t r
 #endif
 }
 
-static void warn_of_destruction(const char *path)
+static int warn_of_destruction(const char *path)
 {
 	struct stat lnkstat;
 	char *abspath = NULL;
 
 	if (lstat(path, &lnkstat) == -1) {
 		perror(_("Failed to lstat the device"));
-		exit(EXIT_FAILURE);
+		return -1;
 	}
 	if (S_ISLNK(lnkstat.st_mode)) {
 		abspath = canonicalize_file_name(path);
 		if (abspath == NULL) {
 			perror(_("Could not find the absolute path of the device"));
-			exit(EXIT_FAILURE);
+			return -1;
 		}
 		/* Translators: Example: "/dev/vg/lv is a symbolic link to /dev/dm-2" */
 		printf( _("%s is a symbolic link to %s\n"), path, abspath);
@@ -612,6 +655,7 @@ static void warn_of_destruction(const char *path)
 	}
 	printf(_("This will destroy any data on %s\n"), path);
 	free(abspath);
+	return 0;
 }
 
 static int zero_gap(struct gfs2_sbd *sdp, uint64_t addr, size_t blocks)
@@ -660,11 +704,11 @@ static lgfs2_rgrps_t rgs_init(struct mkfs_opts *opts, struct gfs2_sbd *sdp)
 		if ((opts->sunit % sdp->bsize) != 0) {
 			fprintf(stderr, _("Stripe unit (%lu) must be a multiple of block size (%u)\n"),
 			        opts->sunit, sdp->bsize);
-			exit(1);
+			return NULL;
 		} else if ((opts->swidth % opts->sunit) != 0) {
 			fprintf(stderr, _("Stripe width (%lu) must be a multiple of stripe unit (%lu)\n"),
 			        opts->swidth, opts->sunit);
-			exit(1);
+			return NULL;
 		} else {
 			al_base = opts->swidth / sdp->bsize;
 			al_off = opts->sunit / sdp->bsize;
@@ -686,7 +730,7 @@ static lgfs2_rgrps_t rgs_init(struct mkfs_opts *opts, struct gfs2_sbd *sdp)
 	rgs = lgfs2_rgrps_init(sdp, al_base, al_off);
 	if (rgs == NULL) {
 		perror(_("Could not initialise resource groups"));
-		exit(-1);
+		return NULL;
 	}
 
 	if (opts->debug) {
@@ -901,7 +945,7 @@ static int default_journal_size(unsigned bsize, uint64_t num_blocks)
 	return 262144;                          /*   1 GB */
 }
 
-static void sbd_init(struct gfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsize)
+static int sbd_init(struct gfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsize)
 {
 	memset(sdp, 0, sizeof(struct gfs2_sbd));
 	sdp->time = time(NULL);
@@ -915,15 +959,16 @@ static void sbd_init(struct gfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsiz
 
 	if (compute_constants(sdp)) {
 		perror(_("Failed to compute file system constants"));
-		exit(1);
+		return -1;
 	}
 	sdp->device.length = opts->dev.size / sdp->bsize;
 	if (opts->got_fssize) {
 		if (opts->fssize > sdp->device.length) {
 			fprintf(stderr, _("Specified size is bigger than the device."));
-			die("%s %.2f %s (%"PRIu64" %s)\n", _("Device size:"),
+			fprintf(stderr, "%s %.2f %s (%"PRIu64" %s)\n", _("Device size:"),
 			       opts->dev.size / ((float)(1 << 30)), _("GB"),
 			       opts->dev.size / sdp->bsize, _("blocks"));
+			return -1;
 		}
 		sdp->device.length = opts->fssize;
 	}
@@ -936,7 +981,7 @@ static void sbd_init(struct gfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsiz
 
 		if (default_jsize < 0) {
 			fprintf(stderr, _("gfs2 will not fit on this device.\n"));
-			exit(1);
+			return -1;
 		}
 		jsize_mb = (default_jsize * sdp->bsize) >> 20;
 		if (jsize_mb < GFS2_MIN_JSIZE)
@@ -950,9 +995,10 @@ static void sbd_init(struct gfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsiz
 		if (max_jsize >= GFS2_MIN_JSIZE)
 			fprintf(stderr, _("Maximum size for %u journals on this device is %uMB.\n"),
 			        opts->journals, max_jsize);
-		exit(1);
+		return -1;
 	}
 	sdp->jsize = opts->jsize;
+	return 0;
 }
 
 static int probe_contents(struct mkfs_dev *dev)
@@ -1004,14 +1050,14 @@ static int probe_contents(struct mkfs_dev *dev)
 	return 0;
 }
 
-static void open_dev(struct mkfs_dev *dev, int withprobe)
+static int open_dev(struct mkfs_dev *dev, int withprobe)
 {
 	int error;
 
 	dev->fd = open(dev->path, O_RDWR|O_CLOEXEC|O_EXCL);
 	if (dev->fd < 0) {
 		perror(dev->path);
-		exit(1);
+		return 1;
 	}
 
 	/* Freshen up the cache */
@@ -1022,7 +1068,7 @@ static void open_dev(struct mkfs_dev *dev, int withprobe)
 	error = fstat(dev->fd, &dev->stat);
 	if (error < 0) {
 		perror(dev->path);
-		exit(1);
+		return 1;
 	}
 
 	if (S_ISREG(dev->stat.st_mode)) {
@@ -1031,14 +1077,15 @@ static void open_dev(struct mkfs_dev *dev, int withprobe)
 		dev->size = lseek(dev->fd, 0, SEEK_END);
 		if (dev->size < 1) {
 			fprintf(stderr, _("Device '%s' is too small\n"), dev->path);
-			exit(1);
+			return 1;
 		}
 	} else {
 		fprintf(stderr, _("'%s' is not a block device or regular file\n"), dev->path);
-		exit(1);
+		return 1;
 	}
 	if (withprobe && (probe_contents(dev) != 0))
-		exit(1);
+		return 1;
+	return 0;
 }
 
 #ifndef UNITTESTS
@@ -1057,17 +1104,28 @@ int main(int argc, char *argv[])
 	srandom(time(NULL) ^ getpid());
 
 	opts_init(&opts);
-	opts_get(argc, argv, &opts);
-	opts_check(&opts);
-
-	open_dev(&opts.dev, !opts.got_topol);
-	bsize = choose_blocksize(&opts);
+	error = opts_get(argc, argv, &opts);
+	if (error == 1)
+		exit(0);
+	if (error != 0)
+		exit(-1);
+	error = opts_check(&opts);
+	if (error != 0)
+		exit(error);
+
+	error = open_dev(&opts.dev, !opts.got_topol);
+	if (error != 0)
+		exit(error);
+	error = choose_blocksize(&opts, &bsize);
+	if (error != 0)
+		exit(-1);
 
 	if (S_ISREG(opts.dev.stat.st_mode)) {
 		opts.got_bsize = 1; /* Use default block size for regular files */
 	}
 
-	sbd_init(&sbd, &opts, bsize);
+	if (sbd_init(&sbd, &opts, bsize) != 0)
+		exit(-1);
 	lgfs2_sb_init(&sb, bsize);
 	if (opts.debug) {
 		printf(_("File system options:\n"));
@@ -1083,10 +1141,14 @@ int main(int argc, char *argv[])
 		printf("  swidth = %lu\n", opts.swidth);
 	}
 	rgs = rgs_init(&opts, &sbd);
-	warn_of_destruction(opts.dev.path);
+	if (rgs == NULL)
+		exit(-1);
+	if (warn_of_destruction(opts.dev.path) != 0)
+		exit(-1);
 
 	if (opts.confirm && !opts.override)
-		are_you_sure();
+		if (!are_you_sure())
+			exit(-1);
 
 	if (!S_ISREG(opts.dev.stat.st_mode) && opts.discard) {
 		if (!opts.quiet) {
-- 
2.26.2

